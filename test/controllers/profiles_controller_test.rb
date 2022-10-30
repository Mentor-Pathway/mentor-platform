require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get profiles_show_url
    assert_response :success
  end

  test "should get new" do
    get profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get profiles_create_url
    assert_response :success
  end

  test "should get edit" do
    get profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get profiles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get profiles_destroy_url
    assert_response :success
  end
end
