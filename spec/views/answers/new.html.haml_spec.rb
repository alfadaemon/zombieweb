require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :question => nil,
      :answer => "MyString",
      :correct => false
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "input#answer_question[name=?]", "answer[question]"
      assert_select "input#answer_answer[name=?]", "answer[answer]"
      assert_select "input#answer_correct[name=?]", "answer[correct]"
    end
  end
end
