require 'spec_helper'

describe "levels/index" do
  before(:each) do
    assign(:levels, [
      stub_model(Level,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Level,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of levels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
