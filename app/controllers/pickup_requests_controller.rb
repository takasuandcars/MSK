class PickupRequestsController < ApplicationController
    
    
    def index
       
        @pickup_request = PickupRequest.new
        if  params[:search].nil? 
            @datas = PickupRequest.all
        else
           @datas = PickupRequest.where(pickup_date: (params[:search][:start_day])..(params[:search][:end_day]))

        end

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
end
