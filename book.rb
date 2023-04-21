# frozen_string_literal: true

require_relative 'product'

# Book Model
class Book < Product
  attr_reader :reprint_available, :hardcover

  def initialize(title, publisher, year, price, reprint_available)
    super(title, publisher, year, price)
    @reprint_available = reprint_available
  end

  def reprint_available?
    @reprint_available
  end
end
