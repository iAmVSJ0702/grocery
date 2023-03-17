class RemoveCartFromLineItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :line_items, :cart_id, :integer
  end
end
