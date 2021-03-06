require 'pry'
class CashRegister
  attr_accessor :total, :discount, :cart, :total_prices

  def initialize(discount = 0)
    @total = 0
    @discount = discount
  	@cart = []
    @total_prices = []
  end

  def add_item(item, price, quantity=1)
    quantity.times { @cart << item }
    @total_prices << (quantity * price)
    sum = 0
    @total_prices.each { |p| sum += p }
    @total = sum
  end
  
	def apply_discount
		@total = @total - (@total * @discount/100)

		if @discount != 0
			"After the discount, the total comes to $#{@total}."
		else
			'There is no discount to apply.'
		end
	end
	
	def items
		@cart
	end
	
	def void_last_transaction
		@total = @total - @total_prices.last
		@total
	end
	 
end


test = CashRegister.new(15)
test.add_item('camera', 150)
test.apply_discount

grocery = CashRegister.new
grocery.add_item('book', 6.5, 2)
grocery.add_item('doll', 1.5, 4)

#test.add_item('eggs', 1.5, 2)
#test.add_item('butter', 3)
#test.add_item('ham', 10, 2)