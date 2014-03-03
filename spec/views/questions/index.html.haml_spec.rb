require 'spec_helper'

describe "questions/index" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :level => nil,
        :category => nil,
        :question => "Question"
      ),
      stub_model(Question,
        :level => nil,
        :category => nil,
        :question => "Question"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Question".to_s, :count => 2
  end
end
