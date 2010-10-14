require 'test_helper'

class HomePageTest < ActionController::IntegrationTest
  test "check for Welcome" do
    visit "/"
    assert_contain("Welcome")
end

end
