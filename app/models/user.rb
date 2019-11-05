class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  validates :name, presence: true, uniqueness: true
end
