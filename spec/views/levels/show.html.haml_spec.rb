require 'spec_helper'

describe "levels/show" do
  before(:each) do
    @level = assign(:level, stub_model(Level,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
