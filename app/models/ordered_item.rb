class OrderedItem < ApplicationRecord
  belongs_to :item , optional: true
  belongs_to :order , optional: true
end
