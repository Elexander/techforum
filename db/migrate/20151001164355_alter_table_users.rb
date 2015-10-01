#rails g migration name_migration
class AlterTableUsers < ActiveRecord::Migration
  def up
  	add_column :users, :exp, :integer, default: 0
  end

  def down
  	remove_column :users, :exp
  end
end
