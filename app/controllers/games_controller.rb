class GamesController < ApplicationController

  def index
    @games = Game.all || []
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.owner = current_user
    if game.save
      current_user.join(game)
      flash[:notice] = "New game created."
      redirect_to action: :index
    else
      flash[:error] = "Could not create new game."
      redirect_to action: :index
    end
  end

  def show
    @game = Game.find(params[:id])
    @history = ChatHistory.where(game: @game).includes(:user).limit(10).order("id DESC").reverse
  end

  def join
    game = Game.find(params[:game_id])
    current_user.join(game)
    redirect_to action: :index
  end

  def leave
    game = Game.find(params[:game_id])
    current_user.leave(game)
    redirect_to action: :index
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy!
    redirect_to action: :index
  end

  private

    def game_params
      params.require(:game).permit(:name)
    end

end
