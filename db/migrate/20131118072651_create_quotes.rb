class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :quote
      t.string :author
      t.string :note
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
