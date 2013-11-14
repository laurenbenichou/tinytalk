require 'spec_helper'

describe "text_pins/index" do
  before(:each) do
    assign(:text_pins, [
      stub_model(TextPin,
        :title => "Title",
        :content => "MyText",
        :user_id => 1
      ),
      stub_model(TextPin,
        :title => "Title",
        :content => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of text_pins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
