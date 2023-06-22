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
  
end