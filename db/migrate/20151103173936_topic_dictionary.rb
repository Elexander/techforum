class TopicDictionary < ActiveRecord::Migration
  def up
  	create_table :topic_dictionaries do |t|
      t.integer :main_topic_id
      t.string :secondary_name
  	end
  end

  def down
  	drop_table :topic_dictionaries
  end
end
