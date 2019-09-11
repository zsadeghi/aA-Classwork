class Employee

  attr_reader :title, :name, :salary, :boss

  def initialize(name, title, salary, boss)
  
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  
  end



end

class Manager < Employee

  attre_reader :reports


  def initialize(name, title, salary, boss, reports)
    super(name, title, salary, boss)
    @reports = Array.new()

  end

  def employee_assignment(manager)

    if employee.title != "manager"
      raise 
      "this employee is not a manager"
      next
    end
    #array of all employees first , then we want to add only the employees who have x as a boss
    #into the reports array for x.

  end
  

end

emp1 = Employee.new("Kate", "manager", 1, "Nate")


