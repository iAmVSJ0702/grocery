class OrderedItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def total
    item.price * quantity
  end
end
