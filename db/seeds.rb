# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cart.destroy_all
Item.destroy_all
User.destroy_all
Brand.destroy_all
Subcategory.destroy_all
Category.destroy_all

#Loading Category data in the database.
Category.create! [
	{name: "Fruits/Veggies"},
	{name: "Meat/Fish"},
	{name: "Bread/Diary"},
	{name: "Beverages"},
	{name: "Groceries"}
]

Category.first.subcategories.create! [ 
	{name: "Fresh Fruits"},
	{name: "Fresh Veggies"},
	{name: "Fresh Sprouts"}
] 

Category.second.subcategories.create! [ 
	{name: "Fresh Meat"},
	{name: "Fresh Fish"},
	{name: "Fresh Chicken"}
] 

Category.third.subcategories.create! [ 
	{name: "Fresh Bread"},
	{name: "Fresh Milk"},
	{name: "Single tone milk"}
] 

Category.fourth.subcategories.create! [ 
	{name: "Beer"},
	{name: "Cold Drinks"},
	{name: "Tea"}
] 

Category.fifth.subcategories.create! [ 
	{name: "Egg"},
	{name: "Rice"},
	{name: "Wheat"}
] 


Category.first.subcategories.first.brands.create! [{name: "local"},
{name: "chinese"},
{name: "american"}]

Category.first.subcategories.second.brands.create! [{name: "local"},
{name: "chinese"},
{name: "brazilian"}]

Category.first.subcategories.third.brands.create! [{name: "swiss"},
{name: "punjab"},
{name: "arabian"}]


Category.second.subcategories.first.brands.create! [{name: "malda"},
{name: "chinese"},
{name: "buga"}]


Category.second.subcategories.second.brands.create! [{name: "local"},
{name: "Japanese"},
{name: "brazilian"}]


User.create! [{name: "Deepak Tibrewal" , email: "Tibrewal@gmail.com", phone: 8999999999 , address: "Some Apartment" , password: "nuoo" ,account_type: "normal"}, 
{name: "admin" , email: "admin@admin.com" , phone: 8999999997 , address: "admin", password: "admin" , account_type: "admin"}]