class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.boolean :done
      t.integer :board_id
      t.string :file

      t.timestamps
    end
  end
end
