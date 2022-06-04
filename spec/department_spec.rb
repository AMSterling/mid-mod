require './lib/department'
require './lib/employee'

RSpec.describe do
  it "exists" do
    customer_service = Department.new("Customer Service")

    expect(customer_service).to be_a Department
  end

  it "has a name" do
    customer_service = Department.new("Customer Service")

    expect(customer_service.name).to eq("Customer Service")
  end

  it "hires employees" do
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})

    expect(customer_service.employees).to eq([])
    customer_service.hire(bobbi)
    customer_service.hire(aaron)

    expect(customer_service.employees).to eq([bobbi, aaron])
  end

  it "has expenses" do
    customer_service = Department.new("Customer Service")

    expect(customer_service.expenses).to eq(0)

    customer_service.expense(100)
    customer_service.expense(25)

    expect(customer_service.expenses).to eq(125)
  end
end
