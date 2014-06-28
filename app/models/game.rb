class Game < ActiveRecord::Base

  has_one :board

  has_and_belongs_to_many :users

  belongs_to :owner, class_name: "::User"

  def start!
    board = Board.create({game: self})
    board.build_board
  end

end
