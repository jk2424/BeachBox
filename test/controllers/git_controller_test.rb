require 'test_helper'

class GitControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get git_add_url
    assert_response :success
  end

  test "should get ." do
    get git_._url
    assert_response :success
  end

end
