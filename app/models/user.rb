class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :events
  has_secure_password
end
