require 'spec_helper'

describe "pins/index" do
  before(:each) do
    assign(:pins, [
      stub_model(Pin,
        :description => "Description"
      ),
      stub_model(Pin,
        :description => "Description"
      )
    ])
  end

  it "renders a list of pins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
