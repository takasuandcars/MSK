class ReceivedsController < ApplicationController
    
    
    
    def create
        p = PickupRequest.find_by(id: params[:id])
        if p.nil?
            
            r = Received.new(received_params)
            r.save
            redirect_to root_url
        else
            
            r = p.Received.build(received_params)
            r.save
            
            redirect_to root_url
        end
    end
    
        private
            def received_params
                params.require(:received).permit(:received_date, :awb )
            end
    
    
end
