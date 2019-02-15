class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Userは多くのStockデータを持っていることを表現
  has_many :stocks
end
