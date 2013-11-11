class Board < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_many :users

  has_many :posts, dependent: :destroy

  validates :title, presence: :true
end
