class PickupRequestsController < ApplicationController
    
    def create
        p = PickupRequest.new(pickup_params)
        p.save
      
        redirect_to root_url
    end
    
    def update
      
    end
    
    def index
        @datas = PickupRequest.all
        @pickup_request = PickupRequest.new
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
