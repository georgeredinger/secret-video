require 'spec_helper'

describe "stats/edit.html.erb" do
  before(:each) do
    @stat = assign(:stat, stub_model(Stat,
      :new_record? => false,
      :user_agent => "MyString",
      :success => 1,
      :failure => 1
    ))
  end

  it "renders the edit stat form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => stat_path(@stat), :method => "post" do
      assert_select "input#stat_user_agent", :name => "stat[user_agent]"
      assert_select "input#stat_success", :name => "stat[success]"
      assert_select "input#stat_failure", :name => "stat[failure]"
    end
  end
end
