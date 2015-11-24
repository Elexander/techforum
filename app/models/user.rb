class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable,:confirmable
  acts_as_messageable
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :last_name, :name, :image, :password, :password_confirmation, :remember_me, :exp, :badge_id
  
  belongs_to :badge
  has_many :posts
  has_many :comments
  has_many :privatemessages
  
  
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }, :default_url => "/assets/missing_avatar1.jpg"
  validates_attachment :image, :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff|jpg)$/ }

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

end
