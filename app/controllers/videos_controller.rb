require 'aws/s3'
require 'open-uri'
require 'valid_browser.rb'
class VideosController < ApplicationController
before_filter :restrict_browser
include  ValidBrowser

  def restrict_browser
    unless valid_browser?
      @user_agent = UserAgent.parse(request.user_agent)
      @supported_browsers = SupportedBrowsers
      render :action => 'bad_browser'
      return false
    end
  end

   # GET /videos
   # GET /videos.xml
   def index
      @videos = Video.all

      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @videos }
      end
   end

   # GET /videos/1
   # GET /videos/1.xml
   def show
      @video = Video.find(params[:id])
      logger.debug "delivery is #{@video.delivery}"
      @video.url = case @video.delivery
         when /baseline/ then   "/videos/#{@video.url}"
         when 'send_file' then 
           @video.temp_file_name = "#{Rails.root}/public/videos/#{@video.url}"
           @video.save
           "/videos/#{params[:id]}/sendfile.mp4"
         when 's3_public' then @video.url
         when 's3_querystring'  
           AWS::S3::S3Object.url_for(@video.url,'georgeredinger',:expire_in=>10.seconds)
         when 's3_send_file'
           @video.temp_file_name = remote_to_tmp(AWS::S3::S3Object.url_for(@video.url,'georgeredinger'))
           @video.save
           "/videos/#{params[:id]}/sendfile.mp4"
        when  /x_accel_redirect_remote$/
           #@video.temp_file_name = remote_to_tmp(@video.url)
           #@video.save
           "/secret-video/nano.mp4"
        when  /x_accel_redirect$/
           #@video.temp_file_name = remote_to_tmp(@video.url)
           #@video.save
           "/videos/#{params[:id]}/download.mp4"
        else 
            "ooh, noooo"
      end
      respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @video }
      end

   end

   # GET /videos/new
   # GET /videos/new.xml
   def new
      #@video = Video.new
      respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @video }
      end
   end

   # GET /videos/1/edit
   def edit
     # @video = Video.find(params[:id])
   end

   # POST /videos
   # POST /videos.xml
   def create
     # @video = Video.new(params[:video])

      respond_to do |format|
         if @video.save
            format.html { redirect_to(@video, :notice => 'Video was successfully created.') }
            format.xml  { render :xml => @video, :status => :created, :location => @video }
         else
            format.html { render :action => "new" }
            format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
         end
      end
   end

   # PUT /videos/1
   # PUT /videos/1.xml
   def update
     # @video = Video.find(params[:id])

      respond_to do |format|
         if @video.update_attributes(params[:video])
            format.html { redirect_to(@video, :notice => 'Video was successfully updated.') }
            format.xml  { head :ok }
         else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
         end
      end
   end

   # DELETE /videos/1
   # DELETE /videos/1.xml
   def destroy
    #  @video = Video.find(params[:id])
    #  @video.destroy

      respond_to do |format|
         format.html { redirect_to(videos_url) }
         format.xml  { head :ok }
      end
   end

  def download
    @video = Video.find(params[:id])
    delivery = @video.delivery
    respond_to do |format|
      format.mp4 do 
        case delivery
          when  'x_accel_redirect'
            filename = '/home/george/workspace/sv/secret-video/nano.mp4'
            response.headers['Content-Type'] = 'application/force-download'
            response.headers['Content-Disposition'] = "attachment;filename=\"#{filename}\""
            response.headers['X-Accel-Redirect'] = filename
            render :nothing =>true
          when  'x_accel_redirect_remote'
            filename = '/secret-video/nano.mp4'
            response.headers['Content-Type'] = 'application/force-download'
            response.headers['Content-Disposition'] = "attachment;filename=\"#{filename}\""
            response.headers['X-Accel-Redirect'] = filename
            render :nothing =>true
          else
            woops
        end
      end
    end
  end

end

