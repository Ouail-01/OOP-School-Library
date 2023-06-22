require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require 'date'

class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    return puts 'No books found!' if @books.empty?

    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    return puts 'No people found!' if @people.empty?

    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_person
    puts 'Do you whant to create a student (1) or a teacher (2)? [input the number]'
    input = gets.chomp.to_i
    if input === 1
        create_student
    elsif input === 2
        create_teacher
    else
        puts 'Incorrect choice'
    end
  end

  def create_book
    puts 'Create a Book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    puts "Today: #{Date.today}"
    print 'Enter date of the rental: '
    date = gets.chomp
    @rentals << Rental.new(@people[person_index], @books[book_index], date)
    puts 'Rental created successfully'
  end

  def list_rentals
    if @rentals.empty?
        puts 'Rental is empty'
      else
        print 'Enter ID of person: '
        person_id = gets.chomp.to_i
  
        rentals_found = false
        @rentals.each do |rental|
          next unless rental.person.id == person_id
  
          rentals_found = true
          puts 'Rentals:'
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
        end
  
        puts 'No rentals found for the given person' unless rentals_found
    end
  end

  def create_student
    puts 'Create a Student'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    puts 'Has parent permissiom [Y/N]?'
    parent_permission = gets.chomp.downcase
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

end