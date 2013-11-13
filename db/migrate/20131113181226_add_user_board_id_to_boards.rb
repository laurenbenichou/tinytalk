class AddUserBoardIdToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :user_board_id, :integer
  end
end
