class Delivery < ApplicationRecord
  belongs_to :end_user

  def full_address
    '〒' + post_code + ' ' + address + ' ' + address_name
  end

  validates :address_name, presence: :true
  validates :address, presence: :true
  validates :post_code, length: { is: 7}, numericality: { only_integer: true }

end
