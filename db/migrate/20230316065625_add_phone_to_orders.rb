# frozen_string_literal: true

# This is migration for AddPhoneToOrders
class AddPhoneToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :phone, :string
  end
end
