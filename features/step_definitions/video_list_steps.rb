
Given /^I have a video$/ do
    @video = Video.create( :url => "[\"/vids/Chrome_ImF.ogv\",\"/vids/Chrome_ImF.mp4\",\"/vids/Chrome_ImF.webm\"]", :title =>   "google 3 kinds ", :owner =>   "Another Programmer", :description =>   "baseline delivery", :delivery  => :baseline, :player =>:html5)
    @video.save
end

Given /^the video is baseline delivery$/ do
  @video[:delivery].should == :baseline
end

When /^I show$/ do
   
end

Then /^I should see the "play"$/ do
    pending # express the regexp above with the code you wish you had
end

