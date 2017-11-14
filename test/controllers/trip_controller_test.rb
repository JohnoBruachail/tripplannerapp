require 'test_helper'

class TripControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trip_index_url
    assert_response :success
  end

  test "should get show" do
    get trip_show_url
    assert_response :success
  end

  test "should get new" do
    get trip_new_url
    assert_response :success
  end

  test "should get edit" do
    get trip_edit_url
    assert_response :success
  end

end
