require "test_helper"

class SuitePolicyTest < ActiveSupport::TestCase
  setup do
    @suite = suites(:one)
  end

  test "should get new" do
    get new_suite_url
    assert_response :success
  end

  test "should show suite" do
    get suite_url(@suite)
    assert_response :success
  end

  test "should create suite" do
    assert_difference('Suite.count') do
      post suites_url, params: { suite: { dorm_id: @suite.dorm_id, name: @suite.name } }
    end

    assert_redirected_to suite_url(Suite.last)
  end

  test "should update suite" do
    patch suite_url(@suite), params: { suite: { dorm_id: @suite.dorm_id, name: @suite.name } }
    assert_redirected_to suite_url(@suite)
  end

  test "should destroy suite" do
    assert_difference('Suite.count', -1) do
      delete suite_url(@suite)
    end

  
end
  end