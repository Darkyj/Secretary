require 'test_helper'

class IntegrationTestControllerTest < ActionController::TestCase
  test "should get authentication_pages" do
    get :authentication_pages
    assert_response :success
  end

end
