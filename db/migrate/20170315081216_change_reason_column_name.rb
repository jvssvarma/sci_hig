class ChangeReasonColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :reason, :work_summary
  end
end
