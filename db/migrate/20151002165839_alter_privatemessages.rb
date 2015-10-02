class AlterPrivatemessages < ActiveRecord::Migration
  def up
  	rename_column :privatemessages, :usr_sender, :user_id
  end

  def down
  	rename_column :privatemessages, :user_id, :usr_sender
  end
end
