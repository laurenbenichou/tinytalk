class TextPin < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :board_id

  belongs_to :user
end
