class AddRequestHourToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :request_hours, :decimal, default: 0.0
  end
end
