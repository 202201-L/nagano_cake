class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  
  has_one_attached :product_image
  
  
  def get_product_image(size)
    product_image.attached? ? pr_image : 'no_image.jpg'
  end
end
