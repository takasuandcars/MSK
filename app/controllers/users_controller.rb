class UsersController < ApplicationController
  def index
    @datas = User.all.page(params[:page]).per(20)
    
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def show
    now_month = Time.now.month
    @user = User.find_by(id: params[:id])
    work_data = @user.work_times.where('extract(month from start) = ?', now_month)
    
    work_hours = work_data.sum(:hours)
    @work_hours = (work_hours - ( work_hours % 60)) / 60
    @work_days = work_data.count
  end 
end
