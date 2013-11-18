require 'spec_helper'

describe "quotes/edit" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :quote => "MyString",
      :author => "MyString",
      :note => "MyString",
      :user_id => 1,
      :board_id => 1
    ))
  end

  it "renders the edit quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quote_path(@quote), "post" do
      assert_select "input#quote_quote[name=?]", "quote[quote]"
      assert_select "input#quote_author[name=?]", "quote[author]"
      assert_select "input#quote_note[name=?]", "quote[note]"
      assert_select "input#quote_user_id[name=?]", "quote[user_id]"
      assert_select "input#quote_board_id[name=?]", "quote[board_id]"
    end
  end
end
