class WorkSchedulesController < ApplicationController
    
    def index
        @pickup = PickupRequest.find_by(id: params[:id])
        @new = @pickup.work_schedules.build
        @datas = @pickup.work_schedules
    end
    
    
    def create
        p = PickupRequest.find_by(id: params[:id])
        @new = p.work_schedules.build(params_work_time)
        @new.save
        @datas = p.work_schedules
        
    end
    
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        date = WorkSchedule.find_by(id: params[:id])
        @datas = date.pickup_request.work_schedules
        date.destroy
        
    end
    
    private
        def params_work_time
            params.require(:worktime).permit(:workdate)
        end
end
