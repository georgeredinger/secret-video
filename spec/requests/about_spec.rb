require 'spec_helper'

describe "about Page" do
  it "should exist" do
    get '/about'
    response.should be_success 
 end

 it "should be welcoming" do
    get '/about'
    response.should have_selector('h3',:content => "Welcome to the about page")
 end

end

