class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.text :post
      t.integer :vote_count

      t.timestamps
    end
  end
end
