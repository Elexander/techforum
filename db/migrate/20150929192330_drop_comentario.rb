class DropComentario < ActiveRecord::Migration
  def up
  	drop_table :comments
  end

  def down
  	create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :post_id
      t.integer :vote_count

      t.timestamps
  	end
  end
end
