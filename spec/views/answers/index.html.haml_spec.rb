require 'spec_helper'

describe "answers/index" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :question => nil,
        :answer => "Answer",
        :correct => false
      ),
      stub_model(Answer,
        :question => nil,
        :answer => "Answer",
        :correct => false
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
