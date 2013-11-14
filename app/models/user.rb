class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "missing.jpg"


  has_many :user_boards
  has_many :boards, :through => :user_boards, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :pins, dependent: :destroy
  has_many :text_pins, dependent: :destroy
end
