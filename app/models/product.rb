class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :product_image


  def get_product_image
    product_image.attached? ? product_image : 'no_image.jpg'
  end
  
  def in_tax_price
    (non_tax_price * 1.1).floor
  end
end
