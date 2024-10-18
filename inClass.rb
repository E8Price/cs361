class Employee
  attr_accessor :name, :schedule

  def initialize(name, schedule)
    @name = name
    @schedule = schedule
  end
end

class Department
  def initialize()
    @employees = []
  end

  def add_employee(employee)
    @employees <<= employee
  end

  def print_sunday_workers()
    @employees.each do |e|
      if e.schedule.include? "Su"
        puts e.name
      end
    end
  end
end

d = Department.new
d.add_employee(Employee.new("Adrian", "MoTuWeFr"))
d.add_employee(Employee.new("Bailey", "MoTuWeFrSu"))
d.add_employee(Employee.new("Cameron", "TuWeFr"))
d.add_employee(Employee.new("Drew", "MoSu"))

d.print_sunday_workers