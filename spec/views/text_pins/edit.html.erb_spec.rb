require 'spec_helper'

describe "text_pins/edit" do
  before(:each) do
    @text_pin = assign(:text_pin, stub_model(TextPin,
      :title => "MyString",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit text_pin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", text_pin_path(@text_pin), "post" do
      assert_select "input#text_pin_title[name=?]", "text_pin[title]"
      assert_select "textarea#text_pin_content[name=?]", "text_pin[content]"
      assert_select "input#text_pin_user_id[name=?]", "text_pin[user_id]"
    end
  end
end
