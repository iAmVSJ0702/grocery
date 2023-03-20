class Order < ApplicationRecord
  serialize :items, Array
  validates :name, :email, :address, :phone, presence: true
  has_many :ordered_items, dependent: :destroy

  def total
    ordered_items.to_a.sum { |orderable| orderable.total }
  end
end
