class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :passwd
      t.string :photo
      t.string :nickname
      t.integer :badge_id

      t.timestamps
    end
  end
end
