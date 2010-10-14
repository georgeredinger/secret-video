# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# <%= f.select :player, [:html5, :flowplayer,:jw_player,:youtube,:vimeo] %> 

Video.delete_all

[:baseline, :send_file, :s3_public,:s3_querystring,:s3_send_file,:url_send_file,:x_accel_redirect,:x_accel_redirect_remote_localhost,:x_accel_redirect_remote_s3].each do |delivery|
   vid = Video.create( :url => "[\"/vids/Chrome_ImF.ogv\",\"/vids/Chrome_ImF.mp4\",\"/vids/Chrome_ImF.webm\"]", :title =>   "google 3 kinds ", :owner =>   "Programmer", :description =>   "#{delivery}", :delivery  => delivery, :player =>:html5)
end

[:baseline, :send_file, :s3_public,:s3_querystring,:s3_send_file,:url_send_file,:x_accel_redirect,:x_accel_redirect_remote_localhost,:x_accel_redirect_remote_s3].each do |delivery|
  vid = Video.create( :url => "/vids/trailer_400p.flv", :title =>   "flash", :owner =>   "Another Programmer", :description =>   "baseline delivery", :delivery  => delivery, :player =>:flowplayer)
end


