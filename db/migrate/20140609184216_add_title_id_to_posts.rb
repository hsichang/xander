class AddTitleIdToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :title_id, :integer
    rename_column :posts, :billboard_text, :body
  end

  def down
    remove_column :posts, :title_id
    rename_column :posts, :body, :billboard_text
  end
end
