class Category < ApplicationRecord
	validates :name , presence: true , uniqueness: {case_sensitive: false}
	has_many :subcategories , dependent: :destroy
	has_many :items , through: :subcategories
end
