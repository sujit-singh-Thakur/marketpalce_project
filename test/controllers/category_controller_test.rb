require "test_helper"

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get category_form_url
    assert_response :success
  end
end
