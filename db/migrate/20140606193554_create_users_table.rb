class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :password
      t.string :encrypted_password
      t.string :password_hash
      t.string :salt
      t.string :login_token, :null => false
      t.string :email_address, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
