class AddOrderAndVisibleAndDeletedToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :order, :integer, :null => false, :default => 100
    add_column :posts, :visible, :boolean, :null => false, :default => true
    add_column :posts, :deleted, :boolean, :null => false, :default => false
  end

  def down
    remove_column :posts, :order
    remove_column :posts, :visible
    remove_column :posts, :deleted
  end
end
