require "test_helper"

class WorkerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get worker_home_url
    assert_response :success
  end
end
