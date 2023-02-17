class Item < ApplicationRecord

  validates :title , :price , presence: true
  validates :price , numericality: { message: "Integer Only"}
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :brand
  has_and_belongs_to_many :users
  has_many :carts , dependent: :destroy
  has_many :OrderedItems , dependent: :nullify

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
