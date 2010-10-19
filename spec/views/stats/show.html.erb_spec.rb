require 'spec_helper'

describe "stats/show.html.erb" do
  before(:each) do
    @stat = assign(:stat, stub_model(Stat,
      :user_agent => "User Agent",
      :success => 1,
      :failure => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/User Agent/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
