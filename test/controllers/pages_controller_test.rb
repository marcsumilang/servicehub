require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end

  test "should get terms" do
    get pages_terms_url
    assert_response :success
  end

  test "should get deletion" do
    get pages_deletion_url
    assert_response :success
  end
end
