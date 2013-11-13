class AddUserBoardIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_board_id, :integer
  end
end
