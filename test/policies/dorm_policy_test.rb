require "test_helper"

class DormPolicyTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
    setup do
      @dorm = dorms(:one)
    end

    test "should get new" do
      get new_dorm_url
      assert_response :success
    end


  test "should show dorm" do
    get dorm_url(@dorm)
    assert_response :success
  end

  test "should create dorm" do
    assert_difference('Dorm.count') do
      post dorms_url, params: { dorm: { name: @dorm.name } }
    end

    assert_redirected_to dorm_url(Dorm.last)
  end

  test "should update dorm" do
    patch dorm_url(@dorm), params: { dorm: { name: @dorm.name } }
    assert_redirected_to dorm_url(@dorm)
  end

  test "should destroy dorm" do
    assert_difference('Dorm.count', -1) do
      delete dorm_url(@dorm)
    end
    
  end


  

  