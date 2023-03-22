# frozen_string_literal: true

# This is migration for CreateBrands
class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
