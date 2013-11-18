require 'spec_helper'

describe "quotes/new" do
  before(:each) do
    assign(:quote, stub_model(Quote,
      :quote => "MyString",
      :author => "MyString",
      :note => "MyString",
      :user_id => 1,
      :board_id => 1
    ).as_new_record)
  end

  it "renders new quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quotes_path, "post" do
      assert_select "input#quote_quote[name=?]", "quote[quote]"
      assert_select "input#quote_author[name=?]", "quote[author]"
      assert_select "input#quote_note[name=?]", "quote[note]"
      assert_select "input#quote_user_id[name=?]", "quote[user_id]"
      assert_select "input#quote_board_id[name=?]", "quote[board_id]"
    end
  end
end
