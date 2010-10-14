require 'spec_helper'

describe "Home Page" do
  it "should exist" do
    get '/'
    response.should be_success 
  end

 it "should welcome the visitor" do
   get '/'
   response.should have_selector('h3',:content => " Welcome to the home page ")
 end

 it "should allow navigation to video" do
   get '/'
   response.should have_selector('a',:href => "/video")
 end

end

