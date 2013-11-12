require 'spec_helper'

describe Post do
    let(:post) {Post.create(title: "post1", content: "our test post")}

    it 'should have an id' do
      post.should respond_to(:id)
      post.id.should_not == nil
    end

    it 'should not have a board_id' do
      post.board_id.should == nil
    end

    it 'should have a board_id' do
      board = Board.create
      post1 = board.posts.push(Post.create(title: "hi"))
      post1.id.should_not == nil
    end
end