class ApplicationController < ActionController::Base
  require 'open-uri'
  protect_from_forgery

  def remote_to_tmp(remote_url)
    base_name = remote_url.split('/')[-1].split('?')[0] 
    temp_file="#{Rails.root}/tmp/#{Process.pid}.#{base_name}"
    unless File.exists? temp_file
      logger.debug "remote_to_tmp #{remote_url}"
      remote=open(remote_url)
      open(temp_file,'w'){|local| local.write remote.read} 
    end
    temp_file
  end
end
