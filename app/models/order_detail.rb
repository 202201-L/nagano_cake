class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  
  def sub_total
    product.in_tax_price * amount
  end
end
