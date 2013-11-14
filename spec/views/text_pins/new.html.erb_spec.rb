require 'spec_helper'

describe "text_pins/new" do
  before(:each) do
    assign(:text_pin, stub_model(TextPin,
      :title => "MyString",
      :content => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new text_pin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", text_pins_path, "post" do
      assert_select "input#text_pin_title[name=?]", "text_pin[title]"
      assert_select "textarea#text_pin_content[name=?]", "text_pin[content]"
      assert_select "input#text_pin_user_id[name=?]", "text_pin[user_id]"
    end
  end
end
