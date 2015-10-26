class AddColumnExpBadge < ActiveRecord::Migration
  def up
  	add_column :badges, :exp, :integer
  end

  def down
  	remove_column :badges, :exp
  end
end
