class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :first_name_kana, presence: :true
  validates :last_name_kana, presence: :true
  validates :email, presence: :true
  validates :encrypted_password, presence: :true
  validates :post_code, length: { is: 7}, numericality: { only_integer: true }
  validates :address, presence: :true
  validates :tel, numericality: { only_integer: true }
  
end
