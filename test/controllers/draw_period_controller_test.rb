require 'test_helper'
include Warden::Test::Helpers 
Warden.test_mode!

## TODO: write test setup with current_user set
class DrawPeriodControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_period = draw_periods(:one)
    @user = User.create(
            :first_name => "Bob", 
            :last_name => "Testerson", 
            :email => "ashmc@g.hmc.edu", 
            :is_admin => true, 
            )
    login_as(@user)
    # assert.equal(current_user, @user)
  end

  ##
  #test "should get index" do
  #  get draw_periods_url
  #  assert_response :success
  #end

  test "should get new" do
    get new_draw_period_url
    assert_response :success
  end

  ##
  #test "should create draw period" do
  #  assert_difference('DrawPeriod.count') do
  #    post draw_periods_url, 
  #        params: { draw_period: { 
  #          start_datetime: @draw_period.start_datetime, 
  #          end_datetime: @draw_period.end_datetime, 
  #          last_updated_by: @draw_period.last_updated_by
  #          }
  #        }
  #  end
  #  assert_redirected_to root_url
  #end

  ##
  #test "should show draw period" do
  #  get draw_period_url(@draw_period)
  #  assert_response :success
  #end

  test "should get edit" do
    get edit_draw_period_url(@draw_period)
    assert_response :success
  end

  ##
  #test "should update draw period" do
  #  patch draw_period_url(@draw_period), 
  #        params: { draw_period: { 
  #          start_datetime: @draw_period.start_datetime, 
  #          end_datetime: @draw_period.end_datetime, 
  #          last_updated_by: @draw_period.last_updated_by 
  #          }
  #        }
  #  assert_redirected_to root_url
  #end

  test "should destroy draw_period" do
    assert_difference('DrawPeriod.count', -1) do
      delete draw_period_url(@draw_period)
    end
    
    assert_redirected_to draw_periods_url
  end
end
