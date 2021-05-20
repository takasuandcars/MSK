class ReceivedsController < ApplicationController
    
    def new
        @received = Received.new
        
        @pickup_request = PickupRequest.new
    end
    
    def create
      
    end
    
        private
            def received_params
                params.require(:received).permit(:received_date, :awb )
            end
    
    
end
