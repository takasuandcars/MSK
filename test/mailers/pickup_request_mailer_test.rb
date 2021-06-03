require 'test_helper'

class PickupRequestMailerTest < ActionMailer::TestCase
  test "send_pickup_request" do
    mail = PickupRequestMailer.send_pickup_request
    assert_equal "Send pickup request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
