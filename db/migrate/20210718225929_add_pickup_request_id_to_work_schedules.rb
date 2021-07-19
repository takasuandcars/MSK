class AddPickupRequestIdToWorkSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :work_schedules, :pickup_request_id, :integer
  end
end
