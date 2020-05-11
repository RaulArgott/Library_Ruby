require 'test_helper'

class PenaltiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get penalties_index_url
    assert_response :success
  end

end
