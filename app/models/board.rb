class Board < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_many :user_boards
  has_many :users, :through => :user_boards
  has_many :posts, dependent: :destroy

  validates :title, presence: :true
end
