class AddHoursToWorkTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :work_times, :hours, :float
  end
end
