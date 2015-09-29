class Badge < ActiveRecord::Base
  attr_accessible :description, :image, :name
  has_many :users
end	
