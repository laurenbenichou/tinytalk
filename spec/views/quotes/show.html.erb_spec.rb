require 'spec_helper'

describe "quotes/show" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :quote => "Quote",
      :author => "Author",
      :note => "Note",
      :user_id => 1,
      :board_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Quote/)
    rendered.should match(/Author/)
    rendered.should match(/Note/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
