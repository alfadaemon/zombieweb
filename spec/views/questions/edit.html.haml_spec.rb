require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :level => nil,
      :category => nil,
      :question => "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_level[name=?]", "question[level]"
      assert_select "input#question_category[name=?]", "question[category]"
      assert_select "input#question_question[name=?]", "question[question]"
    end
  end
end
