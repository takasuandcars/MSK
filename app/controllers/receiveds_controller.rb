class ReceivedsController < ApplicationController
    
    
    
    def create
        
        r = Received.new(received_params)
        r.save
        redirect_to root_url
      
    end
    
        private
            def received_params
                params.require(:received).permit(:received_date, :awb )
            end
    
    
end
