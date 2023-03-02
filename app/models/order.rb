class Order < ApplicationRecord
  belongs_to :user , optional: true
  has_many :OrderedItems , dependent: :destroy
end
