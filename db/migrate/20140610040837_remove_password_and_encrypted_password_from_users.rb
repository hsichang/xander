class RemovePasswordAndEncryptedPasswordFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password
    remove_column :users, :encrypted_password
  end

  def down
    add_column :users, :password, :string
    add_column :users, :encrypted_password, :string
  end
end
