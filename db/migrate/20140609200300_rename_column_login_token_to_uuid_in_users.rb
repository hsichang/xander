class RenameColumnLoginTokenToUuidInUsers < ActiveRecord::Migration
  def up
    rename_column :users, :login_token, :uuid
  end

  def down
    rename_column :users, :uuid, :login_token
  end
end
