class Order < ApplicationRecord
  serialize :items, Array
  validates :name, :email, :address, :phone, presence: true
end
