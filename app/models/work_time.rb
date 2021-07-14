class WorkTime < ApplicationRecord
    belongs_to :user
    before_update :calhours
    
    def calhours
        if self.end
            self.update_column(:hours, (self.end - self.start) / 60)
        end
    end
      
end
