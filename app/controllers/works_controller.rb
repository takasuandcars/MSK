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
  
  def self.getworkday(d)
    while HolidayJp.holiday?(d) do
            d = d + 1
    end
        
        day = d.wday
         
        if day < 6
            return d
        elsif day == 6
            d = d + 2
            return d
        else
            d = d + 1
            return d
        end
       
  end
  
  def self.getworkdayend(d)
    while HolidayJp.holiday?(d) do
            d = d + 1
    end
        
        day = d.wday
         
        if day < 6
            return d + 1
        elsif day == 6
            d = d + 2
            return d + 1
        else
            d = d + 1
            return d + 1
        end
       
  end
  
  private
    def params_works
      params.require(:work_time).permit(:start, :end) 
                                                
    end
    
    
end
