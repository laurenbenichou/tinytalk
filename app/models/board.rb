class Board < ActiveRecord::Base
  attr_accessible :title, :user_id

  belongs_to :user

  has_many :posts, as: :postable, dependent: :destroy

  validates :title, presence: :true
end
