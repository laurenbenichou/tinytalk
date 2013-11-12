require 'spec_helper'

describe Board do
  let(:board) {Board.create(title: "board1")}

  it 'should have an id' do
    board.should respond_to(:id)
    board.id.should_not == nil
  end


  it 'should have a user_id' do
    board.should respond_to(:user_id)
    board.user_id.should_not == nil
  end


end
