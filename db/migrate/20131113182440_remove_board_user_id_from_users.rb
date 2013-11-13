class RemoveBoardUserIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :user_board_id
  end

  def down
    add_column :users, :user_board_id, :integer
  end
end
