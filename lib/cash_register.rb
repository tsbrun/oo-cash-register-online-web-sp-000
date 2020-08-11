require "pry"

class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times {@items << title}

    @last_transaction = {"title" => title, "price" => price, "quantity" => quantity}
  end

  def apply_discount
    if @discount != 0
      discount = @discount.to_f / 100
      total = @total.to_f

      @total = (total - (total * discount)).to_i

      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total - @last_transaction["price"]
  end

end
