class Department
  attr_reader :name, :employees, :expenses

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
  end

  def hire(name)
    employees << name
  end

  def expense(amount)
    @expenses += amount
  end
end
