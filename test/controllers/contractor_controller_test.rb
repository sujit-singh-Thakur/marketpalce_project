require "test_helper"

class ContractorControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get contractor_home_url
    assert_response :success
  end
end
