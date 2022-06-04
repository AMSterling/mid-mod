require './lib/department'
require './lib/employee'
require './lib/budget'

RSpec.describe do
  it "has an annual budget and a way to read it" do
    budget = Budget.new("2021")

    expect(budget).to be_a Budget
    expect(budget.year).to eq("2021")
  end

  it "can list all departments" do
    budget = Budget.new("2021")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    marketing = Department.new("Marketing")

    expect(budget.departments).to eq([])

    budget.add_department(customer_service)
    budget.add_department(sales)
    budget.add_department(marketing)

    expect(budget.departments).to eq([customer_service, sales, marketing])
  end

  it "can list departments with expenses below $500" do
    budget = Budget.new("2021")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    marketing = Department.new("Marketing")

    expect(budget.expenses_under_500).to eq([])
 
    budget.add_department(customer_service)
    budget.add_department(sales)
    budget.add_department(marketing)

    customer_service.expense(100)
    customer_service.expense(25)
    sales.expense(200)
    sales.expense(100)
    marketing.expense(600)

    expect(budget.expenses_under_500).to eq([customer_service, sales])
  end

  it "can list all employees and salaries" do
    budget = Budget.new("2021")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    marketing = Department.new("Marketing")

    budget.add_department(customer_service)
    budget.add_department(sales)
    budget.add_department(marketing)

    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
    abdul = Employee.new({name: "Abdul Redd", age: "30", salary: "600000"})
    erin = Employee.new({name: "Erin Pintozzi", age: "26", salary: "610000"})

    customer_service.hire(bobbi)
    customer_service.hire(aaron)
    sales.hire(erin)
    marketing.hire(abdul)

    expect(budget.employee_salaries).to eq([90000, 100000, 600000, 610000])
  end


end
