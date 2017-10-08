require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get case" do
    get plans_case_url
    assert_response :success
  end

  test "should get drinkward" do
    get plans_drinkward_url
    assert_response :success
  end

end
