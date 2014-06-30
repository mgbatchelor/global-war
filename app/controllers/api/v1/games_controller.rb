module Api
  module V1
    class GamesController < ApplicationController
      skip_before_filter :verify_authenticity_token

      def index
        render json: Game.all, include: [:owner, :users]
      end

      def show
        render json: Game.find(params[:id])
      end

      def create
        game = Game.new(name: params[:name], owner: current_user)
        if game.save
          current_user.join(game)
          render json: game, include: [:owner, :users]
        else
          render json: { errors: game.errors.full_messages }, status: 500
        end
      end

      def destroy
        Game.find(params[:id]).destroy
        render nothing: true
      end

    end
  end
end
