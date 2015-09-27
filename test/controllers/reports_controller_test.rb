require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get by_category" do
    get :by_category
    assert_response :success
  end

  test "should get by_date_range" do
    get :by_date_range
    assert_response :success
  end

end
