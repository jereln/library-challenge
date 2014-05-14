class Library

  attr_accessor :shelves

  $shelf_counter = 0

  def initialize
    @shelves = []
  end

  def all_books
    @shelves.each {|book| book.list_books}
  end

  def shelf_count
    puts $shelf_counter
  end

end

class Shelf

  attr_reader :books

  def initialize
    @books = []
    $shelf_counter += 1
  end

  def add_book(book)
    @books << book
  end

  def remove_book(book)
    @books.delete(book)
  end

  def list_books
    @books.each {|x| puts x.title}
  end
end

class Book

  attr_accessor :title 

  def initialize(title)
    @title = title
  end

  def enshelf(shelf)
    shelf.add_book(self)
    @shelf = shelf
  end

  def unshelf
    @shelf.remove_book(self)
  end
end

#test code

#creating a new library
library = Library.new

#creating some shelves
fiction = Shelf.new
non_fiction = Shelf.new

#adding some books
book1 = Book.new("Twilight")
book2 = Book.new("Harry Potter")
book3 = Book.new("Ruby for Dummies")
book4 = Book.new("How to do Computers")

#shelving books
book1.enshelf(fiction)
book2.enshelf(fiction)
book3.enshelf(non_fiction)
book4.enshelf(non_fiction)

#listing books on shelves
fiction.list_books
non_fiction.list_books

#listing all books
library.all_books

#counting shelves
library.shelf_count

#unshelving books
book1.unshelf
book3.unshelf

#listing shelved books
fiction.list_books
non_fiction.list_books
