class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :video_id
      t.string :caption

      t.timestamps
    end
  end
end
