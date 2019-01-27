require 'test_helper'

class RedirsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get redirs_new_url
    assert_response :success
  end

  test "should get create" do
    get redirs_create_url
    assert_response :success
  end

  test "should get track" do
    get redirs_track_url
    assert_response :success
  end

end
