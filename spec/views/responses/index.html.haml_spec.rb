require 'spec_helper'

describe "responses/index" do
  before(:each) do
    assign(:responses, [
      stub_model(Response,
        :user => nil,
        :answer => nil
      ),
      stub_model(Response,
        :user => nil,
        :answer => nil
      )
    ])
  end

  it "renders a list of responses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
