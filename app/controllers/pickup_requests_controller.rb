class PickupRequestsController < ApplicationController
    
    def create
        p = PickupRequest.new(pickup_params)
        p.save
      
        redirect_to root_url
    end
    
    private
        def pickup_params
         params.require(:pickup_request).permit(:pickup_date, :arrange)
        end
end
