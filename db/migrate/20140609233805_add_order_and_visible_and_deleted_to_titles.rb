class AddOrderAndVisibleAndDeletedToTitles < ActiveRecord::Migration
  def up
    add_column :titles, :order, :integer, :null => false, :default => 100
    add_column :titles, :visible, :boolean, :null => false, :default => true
    add_column :titles, :deleted, :boolean, :null => false, :default => false
  end

  def down
    remove_column :titles, :order
    remove_column :titles, :visible
    remove_column :titles, :deleted
  end
end
