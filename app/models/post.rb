class Post < ActiveRecord::Base
  # attr_accessible :content, :post_date, :title, :topic_id, :type, :user_id
  belongs_to :user
  has_many :comments
  
end
