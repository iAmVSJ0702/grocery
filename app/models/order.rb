class Order < ApplicationRecord
  serialize :items, Array
  validates :name, :email, :address, :phone, presence: true
  has_many :ordered_items, dependent: :destroy
end
