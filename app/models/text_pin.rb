class TextPin < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
