class CreatePrivatemessages < ActiveRecord::Migration
  def change
    create_table :privatemessages do |t|
      t.datetime :pm_date
      t.string :pm_subject
      t.text :pm_content
      t.integer :usr_sender
      t.integer :usr_reciever

      t.timestamps
    end
  end
end
