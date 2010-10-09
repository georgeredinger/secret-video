# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# <%= f.select :player, [:html5, :flowplayer,:jw_player,:youtube,:vimeo] %> 
vid = Video.create( :url => "nano.ogv", :title =>   "title", :owner =>   "Another Programmer", :description =>   "baseline delivery", :delivery  => :baseline, :player =>:html5)
vid = Video.create( :url => "trailer_400p.ogg", :title =>   "bunny ogg", :owner =>   "Another Programmer", :description =>   "baseline delivery", :delivery  => :baseline, :player =>:html5)
vid = Video.create( :url => "nano.ogv", :title =>   "title", :owner =>   "Another Programmer", :description =>   "send_file delivery", :delivery  => :send_file, :player =>:html5)
#vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/oggnano.ogv", :title =>"cloud nano", :owner =>   "Clouded Programmer", :description =>   "public S3 delivery", :delivery  => :s3_public, :player =>:html5)
#vid = Video.create( :url => "nano-private.ogv", :title =>"cloud nano with timeout", :owner =>   "Timely Clouded Programmer", :description =>   "private (query string authentication) S3 delivery", :delivery  => :s3_querystring, :player =>:html5)
#vid = Video.create( :url => "nano-private.ogv", :title =>"secret nano with timeout", :owner =>   "Secret Clouded Programmer", :description =>   "private (query string authentication) send_file delivery", :delivery  => :s3_send_file, :player =>:html5)
#vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/oggnano.ogv", :title =>"video from remote url", :owner =>   "Secret Clouded Programmer", :description =>   "send a public url as a private file", :delivery  => :url_send_file, :player =>:html5)
#vid = Video.create( :url => "http://mirror.bigbuckbunny.de/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov", :title =>"big video from remote url", :owner =>   "Big Buck Bunny Rabbit", :description =>   "this could cause havoc with the tmp storage", :delivery  => :url_send_file, :player =>:html5)
vid = Video.create( :url => "http://localhost/nano.ogv", :title =>"video from local url x-accel-redirect", :owner =>   "pretty Secret ", :description =>   "send a priviate file as a private file", :delivery  => :x_accel_redirect, :player =>:html5)
vid = Video.create( :url => "http://localhost/nano.ogv", :title =>"video from remote url x-accel-redirect_remote", :owner =>   "very Secret Programmer", :description =>   "send a priviate url as a private file", :delivery  => :x_accel_redirect_remote_localhost, :player =>:html5)
#vid = Video.create( :url => "http://s3.amazonaws.com/georgeredinger/oggnano.ogv", :title =>"video from s3 url via x-accel-redirect", :owner =>   "very Secret Programmer", :description =>   "send a priviate url as a private file", :delivery  => :x_accel_redirect_remote_s3, :player =>:html5)

vid = Video.create( :url => "nano.ogv", :title =>   "title", :owner =>   "Another Programmer", :description =>   "baseline delivery", :delivery  => :baseline, :player =>:flowplayer)
vid = Video.create( :url => "trailer_400p.ogg", :title =>   "bunny ogg", :owner =>   "Another Programmer", :description =>   "baseline delivery", :delivery  => :baseline, :player =>:flowplayer)
vid = Video.create( :url => "nano.ogv", :title =>   "title", :owner =>   "Another Programmer", :description =>   "send_file delivery", :delivery  => :send_file, :player =>:flowplayer)
#vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/oggnano.ogv", :title =>"cloud nano", :owner =>   "Clouded Programmer", :description =>   "public S3 delivery", :delivery  => :s3_public, :player =>:flowplayer)
#vid = Video.create( :url => "nano-private.ogv", :title =>"cloud nano with timeout", :owner =>   "Timely Clouded Programmer", :description =>   "private (query string authentication) S3 delivery", :delivery  => :s3_querystring, :player =>:flowplayer)
#vid = Video.create( :url => "nano-private.ogv", :title =>"secret nano with timeout", :owner =>   "Secret Clouded Programmer", :description =>   "private (query string authentication) send_file delivery", :delivery  => :s3_send_file, :player =>:flowplayer)
#vid = Video.create( :url => "http://georgeredinger.s3.amazonaws.com/oggnano.ogv", :title =>"video from remote url", :owner =>   "Secret Clouded Programmer", :description =>   "send a public url as a private file", :delivery  => :url_send_file, :player =>:flowplayer)
#vid = Video.create( :url => "http://mirror.bigbuckbunny.de/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov", :title =>"big video from remote url", :owner =>   "Big Buck Bunny Rabbit", :description =>   "this could cause havoc with the tmp storage", :delivery  => :url_send_file, :player =>:flowplayer)
vid = Video.create( :url => "http://localhost/nano.ogv", :title =>"video from local url x-accel-redirect", :owner =>   "pretty Secret ", :description =>   "send a priviate file as a private file", :delivery  => :x_accel_redirect, :player =>:flowplayer)
vid = Video.create( :url => "http://localhost/nano.ogv", :title =>"video from remote url x-accel-redirect_remote", :owner =>   "very Secret Programmer", :description =>   "send a priviate url as a private file", :delivery  => :x_accel_redirect_remote_localhost, :player =>:flowplayer)
#vid = Video.create( :url => "http://s3.amazonaws.com/georgeredinger/oggnano.ogv", :title =>"video from s3 url via x-accel-redirect", :owner =>   "very Secret Programmer", :description =>   "send a priviate url as a private file", :delivery  => :x_accel_redirect_remote_s3, :player =>:flowplayer)


