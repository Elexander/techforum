class User < ActiveRecord::Base
  # attr_accessible :badge_id, :email, :last_name, :name, :nickname, :passwd, :photo
  belongs_to :badge
  has_many :posts
  has_many :comments
  has_many :privatemessages
end
