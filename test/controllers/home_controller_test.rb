require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get products" do
    get home_products_url
    assert_response :success
  end

  test "should get agents" do
    get home_agents_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
  end

end
