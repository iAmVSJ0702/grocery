# frozen_string_literal: true

# This is LineItem model
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  # LOGIC
  def total_price
    quantity * product.price
  end
end
