namespace :payroll do
  desc "Calculate hours and salary for the payroll period"
  task calculate: :environment do
    if Time.now.thursday?
      employees = Employee.all
      employees.each do |employee|
        payroll_week_hours = Request.where(status: 'approved', user_id: employee.id, date: (1.week.ago.beginning_of_week..1.week.ago.end_of_week)).map { |e| e.day_hours  }.inject(0,&:+)
        if payroll_week_hours > 40
          week_salary = employee.hourly_rate*40 + employee.overtime_rate*(payroll_week_hours-40)
        else
          week_salary = employee.hourly_rate*payroll_week_hours
        end
        PayrollRecord.create!(user_id: employee.id, start_date: 1.week.ago.beginning_of_week, end_date: 1.week.ago.end_of_week, hours: payroll_week_hours, amount: week_salary)
      end
    end
  end
end
