class Link < ActiveRecord::Base
  attr_accessible :board_id, :link, :title, :user_id

   belongs_to :user
  belongs_to :board

  validates :link, presence: true
  validates :title, presence: true
end

