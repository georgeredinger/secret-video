require 'spec_helper'

describe StatsController do

  def mock_stat(stubs={})
    @mock_stat ||= mock_model(Stat, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all stats as @stats" do
      Stat.stub(:all) { [mock_stat] }
      get :index
      assigns(:stats).should eq([mock_stat])
    end
  end

  describe "GET show" do
    it "assigns the requested stat as @stat" do
      Stat.stub(:find).with("37") { mock_stat }
      get :show, :id => "37"
      assigns(:stat).should be(mock_stat)
    end
  end

  describe "GET new" do
    it "assigns a new stat as @stat" do
      Stat.stub(:new) { mock_stat }
      get :new
      assigns(:stat).should be(mock_stat)
    end
  end

  describe "GET edit" do
    it "assigns the requested stat as @stat" do
      Stat.stub(:find).with("37") { mock_stat }
      get :edit, :id => "37"
      assigns(:stat).should be(mock_stat)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created stat as @stat" do
        Stat.stub(:new).with({'these' => 'params'}) { mock_stat(:save => true) }
        post :create, :stat => {'these' => 'params'}
        assigns(:stat).should be(mock_stat)
      end

      it "redirects to the created stat" do
        Stat.stub(:new) { mock_stat(:save => true) }
        post :create, :stat => {}
        response.should redirect_to(stat_url(mock_stat))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved stat as @stat" do
        Stat.stub(:new).with({'these' => 'params'}) { mock_stat(:save => false) }
        post :create, :stat => {'these' => 'params'}
        assigns(:stat).should be(mock_stat)
      end

      it "re-renders the 'new' template" do
        Stat.stub(:new) { mock_stat(:save => false) }
        post :create, :stat => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested stat" do
        Stat.should_receive(:find).with("37") { mock_stat }
        mock_stat.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stat => {'these' => 'params'}
      end

      it "assigns the requested stat as @stat" do
        Stat.stub(:find) { mock_stat(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:stat).should be(mock_stat)
      end

      it "redirects to the stat" do
        Stat.stub(:find) { mock_stat(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(stat_url(mock_stat))
      end
    end

    describe "with invalid params" do
      it "assigns the stat as @stat" do
        Stat.stub(:find) { mock_stat(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:stat).should be(mock_stat)
      end

      it "re-renders the 'edit' template" do
        Stat.stub(:find) { mock_stat(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested stat" do
      Stat.should_receive(:find).with("37") { mock_stat }
      mock_stat.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the stats list" do
      Stat.stub(:find) { mock_stat }
      delete :destroy, :id => "1"
      response.should redirect_to(stats_url)
    end
  end

end
