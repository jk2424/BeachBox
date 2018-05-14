class User < ApplicationRecord
  has_many :orders
  has_secure_password
  validates :email, :phone_number, presence: true, uniqueness: true
end
