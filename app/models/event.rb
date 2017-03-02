class Event < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
end
