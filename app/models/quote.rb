class Quote < ActiveRecord::Base
  attr_accessible :author, :board_id, :note, :quote, :user_id

  belongs_to :user
  belongs_to :board

  validates :quote, presence: true
  validates :author, presence: true
end
