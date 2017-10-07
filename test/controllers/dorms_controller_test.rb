require 'test_helper'

class DormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dorm = dorms(:one)
  end

  test "should get index" do
    get dorms_url
    assert_response :success
  end

  test "should get new" do
    get new_dorm_url
    assert_response :success
  end

  test "should create dorm" do
    assert_difference('Dorm.count') do
      post dorms_url, params: { dorm: {  } }
    end

    assert_redirected_to dorm_url(Dorm.last)
  end

  test "should show dorm" do
    get dorm_url(@dorm)
    assert_response :success
  end

  test "should get edit" do
    get edit_dorm_url(@dorm)
    assert_response :success
  end

  test "should update dorm" do
    patch dorm_url(@dorm), params: { dorm: {  } }
    assert_redirected_to dorm_url(@dorm)
  end

  test "should destroy dorm" do
    assert_difference('Dorm.count', -1) do
      delete dorm_url(@dorm)
    end

    assert_redirected_to dorms_url
  end
end
