require 'spec_helper'

describe "stats/index.html.erb" do
  before(:each) do
    assign(:stats, [
      stub_model(Stat,
        :user_agent => "User Agent",
        :success => 1,
        :failure => 1
      ),
      stub_model(Stat,
        :user_agent => "User Agent",
        :success => 1,
        :failure => 1
      )
    ])
  end

  it "renders a list of stats" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Agent".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
