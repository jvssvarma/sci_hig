class AddDailyHoursToRequests < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :request_hours, :day_hours
    add_column :requests, :in_time, :datetime
    add_column :requests, :out_time, :datetime
  end
end
