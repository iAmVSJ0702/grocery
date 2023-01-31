class Brand < ApplicationRecord
  validates :name , presence: true
  validates_uniqueness_of :name , scope: :subcategory_id , case_sensitive: false
  belongs_to :subcategory , optional: true
  accepts_nested_attributes_for :subcategory
  has_many :items , dependent: :destroy
end
