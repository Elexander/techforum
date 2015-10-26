class AlterTablePostFieldType < ActiveRecord::Migration
  def up
  	rename_column :posts, :type, :post_type
  	change_column :posts, :post_type, :text
  end

  def down
  	rename_column :posts, :post_type, :type
	change_column :posts, :type, :integer
  end
end
