class Cart < ApplicationRecord
  has_many :orderables
  has_many :line_items, dependent: :destroy
  has_many :items, through: :orderables
  belongs_to :user , optional: true
  belongs_to :item , optional: true
  
  def total
    orderables.to_a.sum { |orderable| orderable.total }
  end
end
