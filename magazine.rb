# frozen_string_literal: true

require_relative 'product'

# Magazine Model
class Magazine < Product
  attr_reader :number

  def initialize(title, publisher, year, price, number)
    super(title, publisher, year, price)
    @number = number
  end
end
