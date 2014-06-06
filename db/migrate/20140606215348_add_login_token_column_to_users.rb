class AddLoginTokenColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :login_token, :string, :null => true
  end

  def down
    remove_column :users, :login_token
  end
end
