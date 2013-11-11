class User < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :boards, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

end
