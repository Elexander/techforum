class Dicctionarytopic < ActiveRecord::Base
  attr_accessible :main_topic_id, :secondary_name
  belongs_to :topic
end
