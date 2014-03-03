require 'spec_helper'

describe "responses/edit" do
  before(:each) do
    @response = assign(:response, stub_model(Response,
      :user => nil,
      :answer => nil
    ))
  end

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do
      assert_select "input#response_user[name=?]", "response[user]"
      assert_select "input#response_answer[name=?]", "response[answer]"
    end
  end
end
