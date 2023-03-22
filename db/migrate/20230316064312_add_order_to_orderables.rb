# frozen_string_literal: true

# This is migration for AddOrderToOrderables
class AddOrderToOrderables < ActiveRecord::Migration[7.0]
  def change
    add_reference :orderables, :order, foreign_key: true
  end
end
