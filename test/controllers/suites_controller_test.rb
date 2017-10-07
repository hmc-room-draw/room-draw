require 'test_helper'

class SuitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suite = suites(:one)
  end

  test "should get index" do
    get suites_url
    assert_response :success
  end

  test "should get new" do
    get new_suite_url
    assert_response :success
  end

  test "should create suite" do
    assert_difference('Suite.count') do
      post suites_url, params: { suite: {  } }
    end

    assert_redirected_to suite_url(Suite.last)
  end

  test "should show suite" do
    get suite_url(@suite)
    assert_response :success
  end

  test "should get edit" do
    get edit_suite_url(@suite)
    assert_response :success
  end

  test "should update suite" do
    patch suite_url(@suite), params: { suite: {  } }
    assert_redirected_to suite_url(@suite)
  end

  test "should destroy suite" do
    assert_difference('Suite.count', -1) do
      delete suite_url(@suite)
    end

    assert_redirected_to suites_url
  end
end
