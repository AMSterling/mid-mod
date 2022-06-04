class Budget
  attr_reader :departments, :year, :employees

  def initialize(year)
    @year = year
    @departments = []
    @expenses_under_500 = []
    @employee_salaries = []
  end

  def add_department(department)
    @departments << department
  end

  def expenses_under_500
    offices = @departments.flat_map do |department|
      if department.expenses < 500
         @expenses_under_500 << department
      end
    end
    return @expenses_under_500
  end

  def employee_salaries
    salaries = []
      emps = @departments.flat_map { |department| department.employees }
        emps.each do |emp|
         salaries.push(emp.salary)
      end
      salaries.sort
  end
end
