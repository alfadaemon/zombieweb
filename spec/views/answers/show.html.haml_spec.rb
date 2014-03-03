require 'spec_helper'

describe "answers/show" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :question => nil,
      :answer => "Answer",
      :correct => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(/false/)
  end
end
