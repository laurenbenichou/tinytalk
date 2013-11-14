class AddBoardIdToTextPins < ActiveRecord::Migration
  def change
    add_column :text_pins, :board_id, :integer
  end
end
