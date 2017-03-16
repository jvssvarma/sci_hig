class AddPayRatesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hourly_rate, :decimal
    add_column :users, :overtime_rate, :decimal
  end
end
