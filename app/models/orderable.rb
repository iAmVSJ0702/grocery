# frozen_string_literal: true

# This is Orderable model
class Orderable < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def total
    item.price * quantity
  end
end
