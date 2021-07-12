class ChangeDataTyapeCbm < ActiveRecord::Migration[6.0]
  def change
    change_column :pickup_requests, :cbm, :float
  end
end
