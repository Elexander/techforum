class Post < ActiveRecord::Base
  attr_accessible :content, :post_date, :title, :topic_id, :post_type, :user_id
  belongs_to :user
  has_many :comments
  belongs_to :topic


  scope :today, lambda { where("created_at > ?", 1.day.ago ).last(5) }
  scope :filter_by_type, ->(type)  { where("post_type = ?", type).last(5) }
  scope :filter_by_topic, ->(id) { where("topic_id = ?", id ) if id.present?}
  scope :filter_by_owner, ->(id) {where("user_id = ?", id)}
end
