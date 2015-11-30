class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable,:confirmable
  acts_as_messageable
  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook] 
  

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      url = auth.info.image # assuming the user model has an image
      user.image = URI.parse(auth.info.image).open
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
