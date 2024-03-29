# frozen_string_literal: true

# This is migration for AddQuantityToOrderedItems
class AddQuantityToOrderedItems < ActiveRecord::Migration[7.0]
  def change
    add_column :ordered_items, :quantity, :integer, default: 1, null: false
  end
end
