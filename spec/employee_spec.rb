require './lib/employee'

RSpec.describe Employee do
 it "is exists with attributes" do
   bobbi_info = {name: "Bobbi Jaeger", age: "30", salary: "100000"}
   bobbi = Employee.new(bobbi_info)

   expect(bobbi).to be_a Employee
 end

  it "has a name" do
    bobbi_info = {name: "Bobbi Jaeger", age: "30", salary: "100000"}
    bobbi = Employee.new(bobbi_info)

    expect(bobbi.name).to eq("Bobbi Jaeger")
  end

  it "has an age" do
    bobbi_info = ({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    bobbi = Employee.new(bobbi_info)

    expect(bobbi.age).to eq(30)
  end

  it "has a salary" do
    bobbi_info = {name: "Bobbi Jaeger", age: "30", salary: "100000"}
    bobbi = Employee.new(bobbi_info)

    expect(bobbi.salary).to eq(100000)
  end
end
