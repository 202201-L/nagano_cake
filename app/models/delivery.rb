class Delivery < ApplicationRecord
  belongs_to :end_user
  def full_address
    '〒' + post_code + ' ' + address + ' ' + address_name
  end
end
