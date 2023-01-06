require './app'
require './person'
require './student'
require './teacher'
require './nameable'
require './book'
require './rental'

def rent_book
  if @books.empty?
    puts 'No books to rent.'
    puts 'Enter 4 to create a new book'
    puts ''
    select_option
  else
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_id = gets.chomp.to_i
    if @persons.empty?
      puts 'No persons to rent.'
      puts 'Enter 3 to create a new person'
      select_option
    else
      puts 'Select a person from the following list by number'
      @persons.each_with_index do |person, index|
        puts "#{index}) #{[person.class]} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    person_id = gets.chomp.to_i
    print 'Date (yyyy/mm/dd): '
    date_of_rental = gets.chomp
    @rentals.push(Rental.new(date_of_rental, @persons[person_id], @books[book_id]))
    puts 'Rental created successfully'
    puts ''
    library_menu
  end
end
