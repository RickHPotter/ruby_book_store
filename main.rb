# frozen_string_literal: true

%w[cart book ebook magazine product].each do |file|
  require_relative file
end

books = []
book1 = Book.new('Book1', 'Pub', 2022, 29.0, false)
book2 = Book.new('Book2', 'Pub', 2022, 29.0, false)
book3 = Book.new('Book3', 'Pub', 2022, 39.0, true)
book4 = Book.new('Book4', 'Pub', 2022, 29.0, true)
book5 = Book.new('Book5', 'Pub', 2013, 23.0, true)
book6 = Book.new('Book6', 'Pub', 2018, 19.0, true)

books << book1 << book1 << book1 << book2 << book3 \
        << book4 << book4 << book5 << book6 << book6

magazines = [
  Magazine.new('Magazine1', 'Pub', 2020, 12.0, 16),
  Magazine.new('Magazine2', 'Pub', 2021, 12.0, 16),
  Magazine.new('Magazine3', 'Pub', 2022, 13.0, 16)
]

ebook = Ebook.new('Ebook1', 'Pub', 2018, 19.0)

cart = Cart.new([])
cart << book6
cart << magazines
cart << ebook

puts 'Products Cheaper Than 24: '
Product.invoice cart.cheaper_than(24.0)

puts "\nExporting from Cart: "
cart.export

# puts 'here'
# puts cart.more_sales_year(2013)
