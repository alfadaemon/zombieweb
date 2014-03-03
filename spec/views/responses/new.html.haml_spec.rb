require 'spec_helper'

describe "responses/new" do
  before(:each) do
    assign(:response, stub_model(Response,
      :user => nil,
      :answer => nil
    ).as_new_record)
  end

  it "renders new response form" do
    render

    assert_select "form[action=?][method=?]", responses_path, "post" do
      assert_select "input#response_user[name=?]", "response[user]"
      assert_select "input#response_answer[name=?]", "response[answer]"
    end
  end
end
