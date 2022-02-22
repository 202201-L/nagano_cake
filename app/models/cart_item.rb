class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :product

  validates :amount, presence: :true

  def sub_total
    product.in_tax_price * amount
  end
end
