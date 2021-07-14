class WorksController < ApplicationController
  def index
    @work = WorkTime.first
    @day = Date.today
    
    @monday = @day - (@day.wday - 1)
    

  end

  def show
  end
end
