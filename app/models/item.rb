class Item < ApplicationRecord
  belongs_to :event, dependent: :destroy
end
