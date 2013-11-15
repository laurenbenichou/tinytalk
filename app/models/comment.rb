class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :content, :post_id, :user_id, :board_id

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: :true
end

