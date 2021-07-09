class QrcodeController < ApplicationController
  def index
    if @qr = params[:qr][:qrcode].to_i
      if @u = User.find_by(qrcode: @qr)
  
        @ws = @u.work_times.where('start >= ?', Date.today).first 
        @we = @u.work_times.where('end >= ?', Date.today ).first
        
        if !@ws && !@we
          @newdata = @u.work_times.build(start: Time.now)
          @newdata.save
          @show = "出勤しました"
        elsif @ws && @we
          @show = "退勤してます"
        elsif @ws && !@we
          @ws.end = Time.now
          @ws.save
          @show = "退勤しました"
        elsif !@ws && @we
          @show = "error"
        end
      else
        @show = "ユーザーが見つかりません"
      end
    else
    redirect_to root_url
    end
  end

end
