class ReceivedsController < ApplicationController
    
    def index
        @received = Received.new
        @search_params = received_search_params
        @datas = Received.search(@search_params).page(params[:page]).per(15)
    end
    
    def index_box_in
        @pickup_data = PickupRequest.find_by(id: params[:id])
        @received_datas = @pickup_data.receiveds.all
        @received = @pickup_data.receiveds.build
    end
    
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
    
    def modify
        
        @received = Received.find_by(id: params[:id])
    end
    
    def update
        @received = Received.find_by(id: params[:id])
        @received.update_attributes(received_params)
        
        
    end
    
    def destroy
        @data = Received.find_by(id: params[:id])
        @data.destroy
    end
    
        private
            def received_params
                params.require(:received).permit(:received_date, :awb, :invoice, :inspection, 
                             :shipping, :shipped_date, :number_of_order, :pickup_request_id )
            end
            def received_search_params
                params.fetch(:search, {}).permit(:awb, :inv, :start_day, :end_day)
            end
    
    
end
