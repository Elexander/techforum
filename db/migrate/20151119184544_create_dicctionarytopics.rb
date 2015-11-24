class CreateDicctionarytopics < ActiveRecord::Migration
  def change
    drop_table :topic_dictionaries

    create_table :dicctionarytopics do |t|
      t.integer :main_topic_id
      t.string :secondary_name      

      t.timestamps
    end
  end
end
