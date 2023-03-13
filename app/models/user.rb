
class User < ApplicationRecord

	before_create :check_params

	validates :name , presence: {message: "Name Can't be empty"}
	validates :email , format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid Email"}, uniqueness: { message: "Already exist" , case_sensitive: false }, presence: {message: "Email can't be empty"}
	validates :phone , length: { minimum: 8 , maximum: 10 , message: "Invalid phone number"}, presence: {message: "Phone number can't be empty"}, uniqueness: { message: "Already exist" , case_sensitive: false }, numericality: {message: "It should be numbers"}
	validates :password, presence: {message: "Password can't be empty"}, confirmation: true
	has_and_belongs_to_many :items , dependent: :nullify
	has_secure_password
	
	def my_cart_items
		item_ids = carts.all.pluck :item_id
		Item.where(id: item_ids)
	end

	private
		def check_params
			self.email.downcase!
		end
end
