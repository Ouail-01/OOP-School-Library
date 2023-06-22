require_relative 'person'

class Student < Person
  def initialize(age, name, parent_permission)
    super(name)
    @age = age
    @parent_permission = parent_permission
    @name = name
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
