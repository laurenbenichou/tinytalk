require 'spec_helper'

describe "pins/edit" do
  before(:each) do
    @pin = assign(:pin, stub_model(Pin,
      :description => "MyString"
    ))
  end

  it "renders the edit pin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pin_path(@pin), "post" do
      assert_select "input#pin_description[name=?]", "pin[description]"
    end
  end
end
