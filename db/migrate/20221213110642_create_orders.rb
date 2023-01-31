class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :daddress
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
