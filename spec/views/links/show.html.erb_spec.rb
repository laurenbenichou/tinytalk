require 'spec_helper'

describe "links/show" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :link => "Link",
      :title => "Title",
      :user_id => 1,
      :board_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link/)
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
