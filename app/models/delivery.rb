class Delivery < ApplicationRecord
  belongs_to :end_user

  validates :address_name, presence: :true
  validates :address, presence: :true
  validates :post_code, length: { is: 7}, numericality: { only_integer: true }
end
