require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get login_show_url
    assert_response :success
  end

end
