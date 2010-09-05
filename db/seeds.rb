# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
vid = Video.create( :url => "nano.mp4", :title =>   "title", :owner =>   "Lazy Programmer", :description =>   "direct delivery", :delivery  => :Baseline)
vid = Video.create( :url => "nano.mp4", :title =>   "title", :owner =>   "Another Programmer", :description =>   "send_file delivery", :delivery  => :send_file)
vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/nano.mp4", :title =>"title", :owner =>   "Clouded Programmer", :description =>   "public S3 delivery", :delivery  => :s3_public)
