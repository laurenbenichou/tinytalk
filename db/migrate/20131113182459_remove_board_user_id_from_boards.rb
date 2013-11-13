class RemoveBoardUserIdFromBoards < ActiveRecord::Migration
  def up
    remove_column :boards, :user_board_id
  end

  def down
    add_column :boards, :user_board_id, :integer
  end
end
