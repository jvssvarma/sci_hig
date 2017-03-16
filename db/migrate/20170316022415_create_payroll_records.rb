class CreatePayrollRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :payroll_records do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :hours
      t.decimal :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
