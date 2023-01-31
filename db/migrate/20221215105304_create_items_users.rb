class CreateItemsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :items_users, id: false  do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
