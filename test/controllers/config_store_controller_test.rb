require 'test_helper'

class ConfigStoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get config_store_index_url
    assert_response :success
  end

end
