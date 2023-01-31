
class User < ApplicationRecord

	before_create :check_params

	has_secure_password
	validates :name  , :email , :phone , :address , presence: true
	validates :email , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "Not Valid email" }
	validates :email , :phone , uniqueness: { message: "Already Exist" , case_sensitive: false }
	validates :phone , numericality: { message: "Integer Only" }
	validates :phone , length: { minimum: 8 , maximum: 10 , message: "not valid phone number"}
	has_and_belongs_to_many :items , dependent: :nullify
	has_many :carts , dependent: :destroy
	has_many :orders , dependent: :destroy

	def my_cart_items
		 item_ids = carts.all.pluck :item_id
		 Item.where(id: item_ids)
	end

	private
		def check_params
			self.email.downcase!
		end
end
