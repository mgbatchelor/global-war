class Board < ActiveRecord::Base
  belongs_to :game

  has_many :board_states
  TILES = 100

  def build_board
    number_of_players = 5
    player = []
    number_of_players.times do |p|
      own_tiles = []
      (TILES / number_of_players).times do |t|
        own_tiles << p
      end
      player << own_tiles
    end

    tiles = []
    10.times do |i|
      column = []
      10.times do |j|
        found = player[rand(number_of_players)].pop
        while true
          if found
            column << found
            break
          end
          found = player[rand(number_of_players)].pop
        end
      end
      tiles << column
    end

    update_attributes!({state: tiles.to_json})
  end

  after_commit :store_state
  def store_state
    board_states.create(state: self.state) if self.state
  end


end
