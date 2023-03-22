# frozen_string_literal: true

# This is migration for CreateCarts
class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts, &:timestamps
  end
end
