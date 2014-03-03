require 'spec_helper'

describe "levels/new" do
  before(:each) do
    assign(:level, stub_model(Level,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new level form" do
    render

    assert_select "form[action=?][method=?]", levels_path, "post" do
      assert_select "input#level_name[name=?]", "level[name]"
      assert_select "input#level_description[name=?]", "level[description]"
    end
  end
end
