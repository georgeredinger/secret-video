# Load the rails application
#Gem.clear_paths
ENV['GEM_PATH']= File.expand_path('~/.rvm/gems/ree-1.8.7-2010.02')
require 'rubygems'
# Set up gems listed in the Gemfile.
 if File.exist?(File.expand_path('../../Gemfile', __FILE__))
   require 'bundler'
     Bundler.setup
end

require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sv::Application.initialize!
