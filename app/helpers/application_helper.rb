module ApplicationHelper
    
    def pickup_exist?(received_id)
        received_data = Received.find_by(id: received_id)
        pickup = received_data.pickup_request
        
        if pickup
            return true
        else
            return false
        end
        
    end
    
end
