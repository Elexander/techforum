class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable,:confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :last_name, :name, :image, :password, :password_confirmation, :remember_me
  # attr_accessible :badge_id, :last_name, :name, :nickname, :passwd, :photo
  belongs_to :badge
  has_many :posts
  has_many :comments
  has_many :privatemessages

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }, :default_url => "/images/missing_avatar.jpg"
  validates_attachment :image,:presence => true, :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff|jpg)$/ }
end
