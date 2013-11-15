class TextPin < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :board_id

  belongs_to :user
  belongs_to :board

  validates :content, presence: true
  validates :title, presence: true

end
