require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get countries_index_url
    assert_response :success
  end

  test "should get show" do
    get countries_show_url
    assert_response :success
  end

  test "should get create" do
    get countries_create_url
    assert_response :success
  end

  test "should get update" do
    get countries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get countries_destroy_url
    assert_response :success
  end
end
