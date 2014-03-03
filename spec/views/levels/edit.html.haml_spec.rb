require 'spec_helper'

describe "levels/edit" do
  before(:each) do
    @level = assign(:level, stub_model(Level,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit level form" do
    render

    assert_select "form[action=?][method=?]", level_path(@level), "post" do
      assert_select "input#level_name[name=?]", "level[name]"
      assert_select "input#level_description[name=?]", "level[description]"
    end
  end
end
