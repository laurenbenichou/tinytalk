class Board < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_many :user_boards
  has_many :users, :through => :user_boards
  has_many :pins, dependent: :destroy

  has_many :text_pins, dependent: :destroy

  accepts_nested_attributes_for :users

  validates :title, presence: :true
end
