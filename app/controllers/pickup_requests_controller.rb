class PickupRequestsController < ApplicationController
    
    def create
        p = PickupRequest.new(pickup_params)
        p.save
      
        redirect_to root_url
    end
    
    def update
      
    end
    
    
    private
        def pickup_params
         params.require(:pickup_request).permit(:pickup_date, :arrange, :car_number, 
                                                :received, :number_oftotal_order)
        end
end
