# frozen_string_literal: true

# Stock Model
class Stock
  attr_reader :books

  def initialize(books)
    @books = books
  end

  def export
    @books.each_with_index do |book, index|
      puts "#{index}. #{book.title}, #{book.year}."
    end
  end

  def cheaper_than(price)
    @books.select do |book|
      book.price <= price
    end
  end

  # getter
  def total
    @books.size
  end

  def add(book)
    @books << book if book
  end

  def remove(book)
    @books.delete(book)
  end
end
