require 'test_helper'

class QrcodeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get qrcode_index_url
    assert_response :success
  end

end
