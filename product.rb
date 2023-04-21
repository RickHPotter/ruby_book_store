# frozen_string_literal: true

# SuperClass Product
class Product
  attr_reader :title, :price, :year, :publisher

  def initialize(title, publisher, year, price)
    @title = clean_title(title)
    @year = year
    @publisher = publisher
    @price = final_price(price)
  end

  def clean_title(title)
    title.gsub(/[^\w\s]/, '')
  end

  def to_s
    "#{self.class} - #{@title}, (#{@year}) - £ #{@price}\n"
  end

  def final_price(price)
    case self.class.to_s
    when 'Book'
      if @year < 2019
        price *= 0.91 if reprint_available?
        price * 0.95
      else
        price *= 0.96
      end
      price
    when 'Ebook'
      price * 0.9
    when 'Magazine'
      price * 0.95
    end
  end

  # static method
  def self.invoice(products)
    products.each do |product|
      puts product
    end
  end
end
