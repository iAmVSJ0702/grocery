class CreateOrderedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ordered_items do |t|
      t.string :title
      t.string :price
      t.string :description
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
