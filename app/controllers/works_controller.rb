class WorksController < ApplicationController
  def data
    @work = nil
    @day = if params[:paradate].nil?
             Date.today
           else
             params[:paradate].to_date
           end
    @monday = @day - (@day.wday - 1)

    dates = WorkSchedule.where(workdate: @monday..@monday + 4)
    datesre = Received.where(received_date: @monday..@monday + 4)
    @modata = dates.where(workdate: @monday).sum(:hours) + datesre.where(received_date: @monday).sum(:number_of_order)
    @tudata = dates.where(workdate: @monday + 1).sum(:hours) + datesre.where(received_date: @monday + 1).sum(:number_of_order)
    @wedata = dates.where(workdate: @monday + 2).sum(:hours) + datesre.where(received_date: @monday + 2).sum(:number_of_order)
    @thdata = dates.where(workdate: @monday + 3).sum(:hours) + datesre.where(received_date: @monday + 3).sum(:number_of_order)
    @frdata = dates.where(workdate: @monday + 4).sum(:hours) + datesre.where(received_date: @monday + 4).sum(:number_of_order)
  end

  def index
    @datas = WorkTime.all.page(params[:page]).per(20)
  end

  def edit
    @data = WorkTime.find_by(id: params[:id])
    @username = @data.user.name
  end

  def update
    @data = WorkTime.find_by(id: params[:id])
    @name = @data.user.name
    @data.update_attributes(params_works)
  end

  def show; end

  def self.getworkday(d)
    d += 1 while HolidayJp.holiday?(d)

    day = d.wday

    if day < 6
      d
    elsif day == 6
      d + 2

    else
      d + 1

    end
  end

  def self.getworkdayend(d)
    d += 1 while HolidayJp.holiday?(d)

    day = d.wday

    if day < 6
      d + 1
    elsif day == 6
      d += 2
      d + 1
    else
      d += 1
      d + 1
    end
  end

  private

  def params_works
    params.require(:work_time).permit(:start, :end)
  end
end
