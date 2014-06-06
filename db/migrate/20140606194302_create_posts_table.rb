class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :billboard_text, null: false

      t.timestamp
    end
  end

  def down
    drop_table :posts
  end
end
