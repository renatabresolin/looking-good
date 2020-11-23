require 'test_helper'

class ClothesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothes_index_url
    assert_response :success
  end

  test "should get show" do
    get clothes_show_url
    assert_response :success
  end

  test "should get new" do
    get clothes_new_url
    assert_response :success
  end

  test "should get edit" do
    get clothes_edit_url
    assert_response :success
  end

end
