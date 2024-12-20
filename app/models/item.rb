# frozen_string_literal: true

# This is Item model
class Item < ApplicationRecord
  validates :title, :price, presence: true
  validates :price, numericality: true
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :brand
  has_and_belongs_to_many :users
  has_many :OrderedItems, dependent: :nullify
  has_many :orderables
  has_many :carts, through: :orderables

  has_one_attached :avatar, dependent: :destroy

  def getbrand
    Brand.find_by(id: self[:brand_id]) unless self[:brand_id].nil?
  end

  def getsubcategory
    Subcategory.find_by(id: getbrand[:subcategory_id]) unless getbrand.nil?
  end

  def getcategory
    Category.find_by(id: getsubcategory[:category_id]) unless getsubcategory.nil?
  end
end
