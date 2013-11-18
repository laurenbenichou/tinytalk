require 'spec_helper'

describe "links/edit" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :link => "MyString",
      :title => "MyString",
      :user_id => 1,
      :board_id => 1
    ))
  end

  it "renders the edit link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", link_path(@link), "post" do
      assert_select "input#link_link[name=?]", "link[link]"
      assert_select "input#link_title[name=?]", "link[title]"
      assert_select "input#link_user_id[name=?]", "link[user_id]"
      assert_select "input#link_board_id[name=?]", "link[board_id]"
    end
  end
end
