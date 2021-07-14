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
    
  end
  
  def update
  end

  def show
  end
end
