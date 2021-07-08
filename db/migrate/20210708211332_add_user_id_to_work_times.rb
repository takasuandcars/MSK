class AddUserIdToWorkTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :work_times, :user_id, :integer
  end
end
