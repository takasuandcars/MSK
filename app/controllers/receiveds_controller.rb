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
    
    def show
        @pickup_data = PickupRequest.find_by(id: params[:id].to_i)
        @receivedsin = @pickup_data.receiveds
        
    end
    
        private
            def received_params
                params.require(:received).permit(:received_date, :awb, :invoice, :inspection, 
                             :shipping, :shipped_date, :number_of_order, :pickup_request_id )
            end
    
    
end
