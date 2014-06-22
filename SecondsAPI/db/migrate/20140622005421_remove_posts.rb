class RemovePosts < ActiveRecord::Migration
  def change
    drop_table :posts
    drop_table :microposts
  end
end
