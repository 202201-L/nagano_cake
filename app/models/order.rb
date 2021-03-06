class Order < ApplicationRecord
    has_many :order_details
    belongs_to :end_user
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

    def sub_total
        order_detail.intax_price * order_detail.amount
    end
end