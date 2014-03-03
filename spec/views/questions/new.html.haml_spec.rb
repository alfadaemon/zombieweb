require 'spec_helper'

describe "questions/new" do
  before(:each) do
    assign(:question, stub_model(Question,
      :level => nil,
      :category => nil,
      :question => "MyString"
    ).as_new_record)
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do
      assert_select "input#question_level[name=?]", "question[level]"
      assert_select "input#question_category[name=?]", "question[category]"
      assert_select "input#question_question[name=?]", "question[question]"
    end
  end
end
