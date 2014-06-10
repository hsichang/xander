class AddSuperuserAndActiveToUsers < ActiveRecord::Migration
  def up
    add_column :users, :superuser, :boolean, :null => false, :default => false
    add_column :users, :active, :boolean, :null => false, :default => false
  end

  def down
    remove_column :users, :superuser
    remove_column :users, :active
  end
end
