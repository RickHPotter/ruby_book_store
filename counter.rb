# frozen_string_literal: true

# Module to be extended
module Counter
  attr_reader :max

  def <<(product)
    if product.instance_of?(Array)
      product.each do |prod|
        push(prod)
        puts "prod: #{prod}"
      end
    else
      push(product)
      puts "prod: #{product}"
    end
    @max = size if @max.nil? || @max != size
    self
  end

  def remove(product)
    if @max.nil?
      puts 'Stock is empty. Book cannot be deleted.'
      return
    end
    delete(product)
    @max = size
    self
  end

  def remove_all
    clear
    self
  end
end
