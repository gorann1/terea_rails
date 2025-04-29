require "test_helper"

class UpControllerTest < ActionDispatch::IntegrationTest
  test "should get up" do
    sign_in users(:one)
    get up_url
    assert_response :success
  end

  test "should get up databases" do
    sign_in users(:two)
    get up_databases_url
    assert_response :success
  end
end
