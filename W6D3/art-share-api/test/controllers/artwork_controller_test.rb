require 'test_helper'

class ArtworkControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artwork_create_url
    assert_response :success
  end

  test "should get destroy" do
    get artwork_destroy_url
    assert_response :success
  end

  test "should get index" do
    get artwork_index_url
    assert_response :success
  end

  test "should get show" do
    get artwork_show_url
    assert_response :success
  end

  test "should get update" do
    get artwork_update_url
    assert_response :success
  end

end
