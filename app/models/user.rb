class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :games

  def join(game)
    games << game
  end

  def leave(game)
    games.delete(game)
  end

  def in_game?(game)
    games.include? game
  end

  def is_owner?(game)
    game.owner == self
  end

end
