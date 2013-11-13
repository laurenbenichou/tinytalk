require 'spec_helper'

describe "pins/new" do
  before(:each) do
    assign(:pin, stub_model(Pin,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new pin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pins_path, "post" do
      assert_select "input#pin_description[name=?]", "pin[description]"
    end
  end
end
