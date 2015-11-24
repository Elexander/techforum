class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id, :vote_count
  belongs_to :user
  belongs_to :post
  acts_as_voteable
end
