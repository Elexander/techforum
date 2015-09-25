class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :type
      t.integer :topic_id
      t.integer :user_id
      t.date :post_date

      t.timestamps
    end
  end
end
