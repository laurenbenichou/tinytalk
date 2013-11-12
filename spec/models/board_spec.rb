require 'spec_helper'

describe Board do
  let(:board) {Board.create(title: "board1")}

  it 'should have an id' do
    board.should respond_to(:id)
    board.id.should_not == nil
  end

<<<<<<< HEAD
  # it 'should have a user_id' do
  #   board.should respond_to(:user_id)
  #   board.user_id.should_not == nil
  # end

  # it 'should have multiple posts' do
  #   post1 = board.posts.push(Post.create(title: "post1"))
  #   post1.id.should_not == nil
  # end
=======
  it 'should have a user_id' do
    board.should respond_to(:user_id)
    board.user_id.should_not == nil
  end
>>>>>>> 8d0ead499befea2063f8f210304a13f76b22102b

end
