# frozen_string_literal: true

%w[book stock].each { |file| require_relative file }

book = Book.new('Beginning with Ruby 3', 29.0, 2021, true)
books = [book]

books << Book.new('Learn Enough Ruby to be Dangerous', 39.0, 2022, false)
books << Book.new('Book 2013', 23.0, 2013, false)
books << Book.new('Book 2018', 19.0, 2018, false)

stock = Stock.new(books)

# puts 'Book Context: '
# Book.invoice books

# this is splendid, this one-line each method retrieves its values
# and upon these values it runs the (%:) method assigned
# books.each(&:final_price)

puts 'Books Cheaper Than 24: '
Book.invoice stock.cheaper_than(24.0)

puts "\nExporting from Stock: "
stock.export # 4 books here before removal

# stock.remove(book)
# stock.export # 3 books here after removal
