class PickupRequestsController < ApplicationController
    
    
    def index
       
        @pickup_request = PickupRequest.new
        if  params[:search].nil? 
            @datas = PickupRequest.all
        else
           @datas = PickupRequest.where(pickup_date: (params[:search][:start_day])..(params[:search][:end_day]))

        end

    end
    
    def create_received
        @pickup_data = PickupRequest.find_by(id: params[:id])
        @received_datas = @pickup_data.receiveds.all
        @received = @pickup_data.receiveds.build(pickup_params_receiveds)
        @received.save
    end
    
    def create
        p = PickupRequest.new(pickup_params)
        p.save
      
        redirect_to root_url
    end
    
    def update
        @pickup_request = PickupRequest.find_by(id: params[:id])
        @pickup_request.update_attributes(pickup_params)

      
    end
    
    def destroy
        @pickup_request= PickupRequest.find_by(id: params[:id])
        @pickup_request.destroy
    
    end
    
    def edit
        @pickup_request = PickupRequest.find_by(id: params[:id])

    end
    
    def sendmail
        pickuprequest = PickupRequest.find_by(id: params[:id])
        PickupRequestMailer.send_pickup_request(pickuprequest).deliver
    end
    
    
    private
        def pickup_params
         params.require(:pickup_request).permit(:pickup_date, :arrange, :car_number, 
                                                :received, :number_of_total_order, :number_of_car, :car_type, :weight)
        end
        
        def pickup_params_receiveds
           params.require(:received).permit(:received_date, :awb, :invoice, :inspection, 
                             :shipping, :shipped_date, :number_of_order, :pickup_request_id ) 
        end
end
