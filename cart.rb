# frozen_string_literal: true

require_relative 'counter'

# Cart Model
class Cart
  attr_reader :books

  def initialize(products)
    @products = products
    @products.extend Counter
  end

  def export
    @products.each_with_index do |product, index|
      print "#{index}: "
      puts product
    end
  end

  def cheaper_than(price)
    @products.select do |product|
      product.price <= price
    end
  end

  # getter
  def total
    @products.size
  end

  def <<(product)
    @products << product
  end

  def remove(product)
    @products.remove(product) if @products.include? product
  end

  # this is horrendous, I get it
  def quantity_by(prod, &field)
    @products.count { |product| field.call(product) == field.call(prod) }
  end

  def more_sales_title
    a = @products.sort { |i, j| quantity_by(i, &:title) <=> quantity_by(j, &:title) }
    a.last
  end

  def more_sales_year(year)
    a = @products.select { |product| product.year == year }
    a = a.sort { |i, j| quantity_by(i, &:title) <=> quantity_by(j, &:title) }
    a.last
  end
end
