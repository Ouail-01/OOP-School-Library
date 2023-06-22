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
  
end