# frozen_string_literal: true

# Book Model
class Book
  attr_reader :title, :price, :year, :reprint_available

  def initialize(title, price, year, reprint_available)
    @title = title
    @price = price
    @year = year
    @reprint_available = reprint_available
  end

  def reprint_available?
    @reprint_available
  end

  def final_price
    if @year > 2019
      return @price *= 0.91 if reprint_available?

      @price *= 0.95
    else
      return @price *= 0.96 if reprint_available?

      @price
    end
  end

  # static method
  def self.invoice(books)
    books.each do |book|
      puts "Book: #{book.title} - #{book.price}\n"
    end
  end
end
