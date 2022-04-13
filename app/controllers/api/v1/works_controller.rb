class Api::V1::WorksController < ApplicationController

  def index
    @datas = User.joins(:work_times).select("users.name", "work_times.start","work_times.end", "work_times.hours")
    render json: @datas
  end

def create
  if @qr = params[:qr][:qrcode].to_i
    if @u = User.find_by(qrcode: @qr)
      
      @ws = @u.work_times.where('start >= ?', Date.today).first 
      @we = @u.work_times.where('end >= ?', Date.today ).first
      
      if !@ws && !@we
        @newdata = @u.work_times.build(start: Time.now)
        @newdata.save
        @show = "出勤しました"
        render json: @show
      elsif @ws && @we
        @show = "退勤してます"
        render json: @show
      elsif @ws && !@we
        @ws.end = Time.now
        @ws.save
        @show = "退勤しました"
        render json: @show
      elsif !@ws && @we
        @show = "error"
        render json: @show
      end
    else
      @show = "ユーザーが見つかりません"
      render json: @show
    end
  else
  
  end

end


  private
    def params_works
      params.require(:qrcode).permit(:qrcode)
                                                
    end
    
    
end
