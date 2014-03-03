require 'spec_helper'

describe "answers/edit" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :question => nil,
      :answer => "MyString",
      :correct => false
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do
      assert_select "input#answer_question[name=?]", "answer[question]"
      assert_select "input#answer_answer[name=?]", "answer[answer]"
      assert_select "input#answer_correct[name=?]", "answer[correct]"
    end
  end
end
