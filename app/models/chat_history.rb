class ChatHistory < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def to_json
    {
      user: self.user.email,
      message: self.message,
      created_at: self.created_at
    }.to_json
  end

end
