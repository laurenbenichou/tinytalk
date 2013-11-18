class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link
      t.string :title
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
