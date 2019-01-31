class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount=0)
        @total = 0
        @items = []
        @discount = discount
    end

    def apply_discount
        if discount != 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def add_item(item, price, quantity=1)
        if quantity > 1
            quantity.times {
                @items << item
            }
        else
            @items << item
        end
        @total += price * quantity
        self.last_transaction = price * quantity
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end
end