class StatsController < ApplicationController
  # GET /stats
  # GET /stats.xml
  def index
    @stats = Stat.order("success asc").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stats }
    end
  end

  # GET /stats/1
  # GET /stats/1.xml
  def show
    @stat = Stat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stat }
    end
  end

  # GET /stats/new
  # GET /stats/new.xml
  def new
    @stat = Stat.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stat }
    end
  end

  # GET /stats/1/edit
  def edit
    @stat = Stat.find(params[:id])
  end

  # POST /stats
  # POST /stats.xml
  def create
    @stat = Stat.new(params[:stat])

    respond_to do |format|
      if @stat.save
        format.html { redirect_to(@stat, :notice => 'Stat was successfully created.') }
        format.xml  { render :xml => @stat, :status => :created, :location => @stat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stats/1
  # PUT /stats/1.xml
  def update
    @stat = Stat.find(params[:id])

    respond_to do |format|
      if @stat.update_attributes(params[:stat])
        format.html { redirect_to(@stat, :notice => 'Stat was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.xml
  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy

    respond_to do |format|
      format.html { redirect_to(stats_url) }
      format.xml  { head :ok }
    end
  end

  def check_n_save (play_or_playnot)
      vid = Video.find(params[:id])
      stat=Stat.where(:user_agent => request.user_agent,:delivery => vid.delivery,:player => vid.player,:file_name => vid.url).first
      if not stat 
       stat=Stat.new
       stat.success,stat.failure=0,0
      end
      stat.user_agent = request.user_agent
      stat.success += (play_or_playnot == :play ? 1:0)
      stat.failure += (play_or_playnot != :play ? 1:0)
      stat.delivery = vid.delivery
      stat.player = vid.player
      stat.file_name = vid.url
      stat.save
     render :nothing =>true
  end 

  def played
    check_n_save(:play)  
  end

  def notplayed
     check_n_save(:play_not)
  end

end

