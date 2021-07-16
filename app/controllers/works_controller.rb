class WorksController < ApplicationController
  def data
    @work = WorkTime.first
    @day = Date.today
    
    @monday = @day - (@day.wday - 1)
    
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

  def show
  end
  
  private
    def params_works
      params.require(:work_time).permit(:start, :end) 
                                                
    end
    
    
end
