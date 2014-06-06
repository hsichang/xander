class RemoveNullConstraintFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :login_token
  end

  def down
    add_column :users, :login_token, :null => false
  end
end
