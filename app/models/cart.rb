class Cart < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :item , optional: true

  scope :quantity , -> (id_item, id_user){ where("item_id=? and user_id=?","#{id_item}","#{id_user}").count }
end
