class WorkSchedulesController < ApplicationController
    
    def index
        @pickup = PickupRequest.find_by(id: params[:id])
        @new = @pickup.work_schedules.build
        @datas = @pickup.work_schedules
    end
    
    
    def create
    end
    
    
    def edit
        
    end
    
    def update
        
    end
    
    def delete
    end
end
