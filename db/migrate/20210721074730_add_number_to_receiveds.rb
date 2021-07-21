class AddNumberToReceiveds < ActiveRecord::Migration[6.0]
  def change
    add_column :receiveds, :number, :integer
  end
end
