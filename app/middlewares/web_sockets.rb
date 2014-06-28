require 'faye/websocket'

module GlobalWar
  class WebSockets
    KEEPALIVE_TIME = 15 # in seconds

    def initialize(app)
      @app     = app
      @clients = []
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        # WebSockets logic goes here
        ws = Faye::WebSocket.new(env, nil, { ping: KEEPALIVE_TIME })

        ws.on :open do |event|
          p [:open, ws.object_id]
          @clients << ws
        end

        ws.on :message do |event|
          data = JSON.parse(event.data)
          game = Game.find(data["game_id"])
          user = env["warden"].user
          history = ChatHistory.new({game: game, user: user, message: data["text"]})
          if history.save
            p [:message, history.to_json]
            @clients.each {|client| client.send(history.to_json) }
          else
            ## return error in rack response
          end
        end

        ws.on :close do |event|
          p [:close, ws.object_id, event.code, event.reason]
          @clients.delete(ws)
          ws = nil
        end

        # Return async Rack response
        ws.rack_response
      else
        @app.call(env)
      end
    end

  end
end
