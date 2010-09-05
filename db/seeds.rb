# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
vid = Video.create( :url => "nano.mp4", :title =>   "title", :owner =>   "Lazy Programmer", :description =>   "direct delivery", :delivery  => :baseline)
vid = Video.create( :url => "nano.mp4", :title =>   "title", :owner =>   "Another Programmer", :description =>   "send_file delivery", :delivery  => :send_file)
vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/nano.mp4", :title =>"cloud nano", :owner =>   "Clouded Programmer", :description =>   "public S3 delivery", :delivery  => :s3_public)
vid = Video.create( :url => "nano-private.mp4", :title =>"cloud nano with timeout", :owner =>   "Timely Clouded Programmer", :description =>   "private (query string authentication) S3 delivery", :delivery  => :s3_querystring)
vid = Video.create( :url => "nano-private.mp4", :title =>"secret nano with timeout", :owner =>   "Secret Clouded Programmer", :description =>   "private (query string authentication) send_file delivery", :delivery  => :s3_send_file)
vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/nano.mp4", :title =>"video from remote url", :owner =>   "Secret Clouded Programmer", :description =>   "send a public url as a private file", :delivery  => :url_send_file)
vid = Video.create( :url => "http://mirror.bigbuckbunny.de/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov", :title =>"big video from remote url", :owner =>   "Big Buck Bunny Rabbit", :description =>   "this could cause havoc with the tmp storage", :delivery  => :url_send_file)



