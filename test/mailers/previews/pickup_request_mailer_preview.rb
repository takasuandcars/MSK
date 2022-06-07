# Preview all emails at http://localhost:3000/rails/mailers/pickup_request_mailer
class PickupRequestMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/pickup_request_mailer/send_pickup_request
  def send_pickup_request
    PickupRequestMailer.send_pickup_request
  end
end
