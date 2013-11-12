class Post < ActiveRecord::Base
  attr_accessible :board_id, :content, :done, :file, :title, :user_id

  belongs_to :board
  belongs_to :users

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: :true
  validates :content, presence: :true
end
