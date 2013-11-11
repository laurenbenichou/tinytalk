class Post < ActiveRecord::Base
  attr_accessible :board_id, :content, :done, :file, :title, :user_id
end
