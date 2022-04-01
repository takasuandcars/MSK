class PickupRequestsController < ApplicationController
    
    
    def index
        
        @pickup_request = PickupRequest.new
        @search_params = pickup_search_params
        @datasall = PickupRequest.search(@search_params)
        @datas = @datasall.page(params[:page]).per(20)
        respond_to do |format|
          format.html
          format.xlsx do
            # ファイル名をここで指定する（動的にファイル名を変更できる）
            @search_params = params[:data]
            @excels = PickupRequest.search(@search_params)
            response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
           end
        end
    end
    
        
    def create
        p = PickupRequest.new(pickup_params)
        p.save
        redirect_to pickup_requests_index_path
    end
    
    def create_received
        @pickup_data = PickupRequest.find_by(id: params[:id])
        @received_datas = @pickup_data.receiveds.all
        @received = @pickup_data.receiveds.build(pickup_params_receiveds)
        @received.save
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
                                                :received, :number_of_total_order, :number_of_car, :car_type, :weight, :cbm, :note, :ctn)
        end
        
        def pickup_params_receiveds
           params.require(:received).permit(:received_date, :awb, :invoice, :inspection, 
                             :shipping, :shipped_date, :number_of_order, :pickup_request_id , :number) 
        end
        
        def pickup_search_params
            params.fetch(:search, {}).permit(:car_type, :start_day, :end_day)
        end
end
