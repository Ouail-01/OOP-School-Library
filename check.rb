require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
p  person.correct_name
p  capitalizedPerson = CapitalizeDecorator.new(person)
p  capitalizedPerson.correct_name
p  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p  capitalizedTrimmedPerson.correct_name