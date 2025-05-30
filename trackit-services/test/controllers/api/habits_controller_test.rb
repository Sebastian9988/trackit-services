require "test_helper"

class Api::HabitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_habits_index_url
    assert_response :success
  end

  test "should get show" do
    get api_habits_show_url
    assert_response :success
  end

  test "should get create" do
    get api_habits_create_url
    assert_response :success
  end

  test "should get update" do
    get api_habits_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_habits_destroy_url
    assert_response :success
  end
end
