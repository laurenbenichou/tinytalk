require 'spec_helper'

describe "pins/show" do
  before(:each) do
    @pin = assign(:pin, stub_model(Pin,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
