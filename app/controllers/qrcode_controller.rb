class QrcodeController < ApplicationController
  def index
    if @qr = params[:qr][:qrcode].to_i
      @u = User.find_by(qrcode: @qr)
    else
      redirect_to root_url
    end
    
  end
end
