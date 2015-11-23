class Topic < ActiveRecord::Base
  attr_accessible :name
  has_many :posts

  has_many :dicctionarytopics
  scope :filter_by_name, ->(name)  { where("topic_name = ?", name) }

end
