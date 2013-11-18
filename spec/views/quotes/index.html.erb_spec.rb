require 'spec_helper'

describe "quotes/index" do
  before(:each) do
    assign(:quotes, [
      stub_model(Quote,
        :quote => "Quote",
        :author => "Author",
        :note => "Note",
        :user_id => 1,
        :board_id => 2
      ),
      stub_model(Quote,
        :quote => "Quote",
        :author => "Author",
        :note => "Note",
        :user_id => 1,
        :board_id => 2
      )
    ])
  end

  it "renders a list of quotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Quote".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
