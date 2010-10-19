require "spec_helper"

describe StatsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/stats" }.should route_to(:controller => "stats", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/stats/new" }.should route_to(:controller => "stats", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/stats/1" }.should route_to(:controller => "stats", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/stats/1/edit" }.should route_to(:controller => "stats", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/stats" }.should route_to(:controller => "stats", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/stats/1" }.should route_to(:controller => "stats", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/stats/1" }.should route_to(:controller => "stats", :action => "destroy", :id => "1")
    end

  end
end
