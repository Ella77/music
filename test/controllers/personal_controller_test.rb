require 'test_helper'

class PersonalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get personal_index_url
    assert_response :success
  end

end
