class Api::V1::WorksController < ApplicationController
  def index
    @datas = WorkTime.joins(:user).select('id', 'users.name', 'work_times.start', 'work_times.end', 'work_times.hours')
    # render json: @datas
  end

  def create
    if (@qr = params[:qr][:qrcode].to_i)
      if (@u = User.find_by(qrcode: @qr))

        @ws = @u.work_times.where('start >= ?', Date.today).first
        @we = @u.work_times.where('end >= ?', Date.today).first

        if !@ws && !@we
          @newdata = @u.work_times.build(start: Time.now)
          @newdata.save
          @show = '出勤しました'
          render json: [@show, { message: '出勤しました', status: 'start' }]
        elsif @ws && @we
          @show = '退勤してます'
          render json: [@show, { message: '退勤してます', status: 'finished' }]
        elsif @ws && !@we
          @ws.end = Time.now
          @ws.save
          @show = '退勤しました'
          render json: [@show, { message: '退勤しました', status: 'end' }]
        elsif !@ws && @we
          @show = 'error'
          render json: [@show, { message: 'エラー', status: 'error' }]
        end
      else
        @show = 'ユーザーが見つかりません'
        render json: [@show, { message: 'ユーザーが見つかりません', status: 'nofound' }]
      end
    end
  end

  def update
    data = WorkTime.find_by(id: params[:id])

    if data
      data.update_attributes(params_update)
      render json: data
    end
  end

  private

  def params_works
    params.require(:qrcode).permit(:qrcode)
  end

  def params_update
    params.require(:work).permit(:start, :end)
  end
end
