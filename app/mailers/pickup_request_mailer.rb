class PickupRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pickup_request_mailer.send_pickup_request.subject
  #
  
  default from: "s-isogai@shibamata.co.jp"
  
  def send_pickup_request(pickuprequest)
    @pickuprequest = pickuprequest
         mail to: "satoshi.isogai30@shibamata.co.jp",
         subject: "【集荷依頼】MSK 集荷日:#{@pickuprequest.pickup_date.strftime('%-m月%-d日')} 車種:#{@pickuprequest.car_type} #{@pickuprequest.number_of_car}台　時間:フリー",
         bcc: "s-isogai@shibamata.co.jp"
  end
end
