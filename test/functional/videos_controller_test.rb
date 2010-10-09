require 'test_helper'

class VideosControllerTest < ActionController::TestCase

  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should show video" do
    get :show, :id => @video.to_param
    assert_response :success
  end

  test "should not get edit" do
    get :edit, :id => @video.to_param
    assert_response :success
  end

end
