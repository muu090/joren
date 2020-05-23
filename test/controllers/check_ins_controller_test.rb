require 'test_helper'

class CheckInsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get check_ins_index_url
    assert_response :success
  end

  test "should get show" do
    get check_ins_show_url
    assert_response :success
  end

end
