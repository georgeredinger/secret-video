require 'spec_helper'

describe "stats/new.html.erb" do
  before(:each) do
    assign(:stat, stub_model(Stat,
      :user_agent => "MyString",
      :success => 1,
      :failure => 1
    ).as_new_record)
  end

  it "renders new stat form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => stats_path, :method => "post" do
      assert_select "input#stat_user_agent", :name => "stat[user_agent]"
      assert_select "input#stat_success", :name => "stat[success]"
      assert_select "input#stat_failure", :name => "stat[failure]"
    end
  end
end
