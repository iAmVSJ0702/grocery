# frozen_string_literal: true

# This is Subcategory model
class Subcategory < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :category_id, case_sensitive: false
  belongs_to :category, optional: true
  accepts_nested_attributes_for :category
  has_many :brands, dependent: :destroy
  has_many :items, through: :brands
end
