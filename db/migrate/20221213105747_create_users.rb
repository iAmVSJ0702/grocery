# frozen_string_literal: true

# This is migration for CreateUsers
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, limit: 8
      t.string :address
      t.string :password_digest
      t.string :account_type

      t.timestamps
    end
  end
end
