class WorkSchedule < ApplicationRecord
    belongs_to :pickup_request
    after_create :inputhours
    after_destroy :inputhours
    
    def inputhours
        
        pickup = self.pickup_request
        orders = pickup.total_order
        datas = pickup.work_schedules
        datas.each do |data|
            data.update_attribute(:hours, orders / datas.length)
        end
            
        
    end
end
