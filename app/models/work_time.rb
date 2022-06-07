class WorkTime < ApplicationRecord
  belongs_to :user
  before_update :calhours

  def calhours
    update_column(:hours, (self.end - start) / 60) if self.end
  end
end
