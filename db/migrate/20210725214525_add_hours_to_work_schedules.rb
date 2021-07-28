class AddHoursToWorkSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :work_schedules, :hours, :integer
  end
end
