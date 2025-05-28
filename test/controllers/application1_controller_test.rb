require "test_helper"

class Application1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get application1_index_url
    assert_response :success
  end
end
