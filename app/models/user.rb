class User < ActiveRecord::Base
  attr_accessible :badge_id, :email, :last_name, :name, :nickname, :passwd, :photo
  belongs_to :badge
end
