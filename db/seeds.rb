# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
User.destroy_all
Brand.destroy_all
Subcategory.destroy_all
Category.destroy_all
Order.destroy_all

# Loading Category data in the database.
Category.create! [
  { name: 'Fruits/Vegetable' },
  { name: 'Meat/Fish' },
  { name: 'Bread/Diary' },
  { name: 'Beverages' },
  { name: 'Groceries' }
]

Category.first.subcategories.create! [
  { name: 'Fruits' },
  { name: 'Vegetable' },
  { name: 'Cuts & sprouts' }
]

Category.second.subcategories.create! [
  { name: 'Meat' },
  { name: 'Fish' }
]

Category.third.subcategories.create! [
  { name: 'Bread' },
  { name: 'Dairy' }
]

Category.fourth.subcategories.create! [
  { name: "Soft drinks\t" },
  { name: 'Tea & Coffee' },
  { name: 'Energy/Health drinks' }
]

Category.fifth.subcategories.create! [
  { name: 'Biscuits' }
]

Category.first.subcategories.first.brands.create! [{ name: 'Basketor' }]

Category.first.subcategories.second.brands.create! [{ name: 'Eveg' }]

Category.first.subcategories.third.brands.create! [{ name: 'Earthbound Organics' }]

Category.second.subcategories.first.brands.create! [{ name: 'Wakao Foods' }]

Category.second.subcategories.second.brands.create! [{ name: 'C Shore Foods' }]

Category.third.subcategories.first.brands.create! [{ name: 'Modern' }]

Category.third.subcategories.second.brands.create! [{ name: 'Amul' }]

Category.fourth.subcategories.first.brands.create! [
  { name: 'Pepsi' },
  { name: 'Coke' }
]

Category.fourth.subcategories.second.brands.create! [{ name: 'Nestle' }]

Category.fourth.subcategories.third.brands.create! [
  { name: 'Tropicana' },
  { name: 'Hindustan Unilever' },
  { name: 'ITC' }
]

Category.fifth.subcategories.first.brands.create! [{ name: 'Britannia' }]

Category.first.subcategories.first.brands.first.items.create! [{	title: 'Apple', price: '140',
                                                                 description: 'Baby red apples fruits.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/apple.png"), filename: 'apple.png')

Category.first.subcategories.first.brands.first.items.create! [{	title: 'Raspberry', price: '20',
                                                                 description: 'The raspberry is the edible fruit.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/raspberry.png"), filename: 'raspberry.png')

Category.first.subcategories.second.brands.first.items.create! [{	title: 'Onions', price: '10',
                                                                  description: 'An onion is a vegetable.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/onion.png"), filename: 'onion.png')

Category.first.subcategories.third.brands.first.items.create! [{	title: 'Bean Sprouts', price: '20',
                                                                 description: 'Mung bean sprouts are vegetable.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/sprouts.png"), filename: 'sprouts.png')

Category.second.subcategories.first.brands.first.items.create! [{	title: 'Chicken', price: '250',
                                                                  description: 'Chicken.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/chicken.png"), filename: 'chicken.png')

Category.second.subcategories.second.brands.first.items.create! [{	title: 'Cod', price: '50',
                                                                   description: 'Cod is popular as a food.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/cod.png"), filename: 'cod.png')

Category.third.subcategories.first.brands.first.items.create! [{	title: 'Atta Bread', price: '17',
                                                                 description: 'Whole wheat bread.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/bread.png"), filename: 'bread.png')

Category.third.subcategories.second.brands.first.items.create! [{	title: 'Amul Milk', price: '32',
                                                                  description: 'Milk.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/bread.png"), filename: 'bread.png')

Category.fourth.subcategories.first.brands.first.items.create! [{	title: 'Pepsi', price: '40',
                                                                  description: 'Pepsi.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/pepsi.png"), filename: 'pepsi.png')

Category.fourth.subcategories.first.brands.second.items.create! [{	title: 'Coke', price: '40',
                                                                   description: 'Coca Cola.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/coke.png"), filename: 'coke.png')

Category.fourth.subcategories.second.brands.first.items.create! [{	title: 'Nestle Everyday Tea', price: '10',
                                                                   description: 'Nestle Everyday.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/tea.png"), filename: 'tea.png')

Category.fourth.subcategories.second.brands.first.items.create! [{	title: 'Nestle Coffee', price: '140',
                                                                   description: 'Nestle Coffee.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/coffee.png"), filename: 'coffee.png')

Category.fourth.subcategories.third.brands.first.items.create! [{	title: 'Tropicana Orange', price: '140',
                                                                  description: 'Tropicana Orange.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/tropicana.png"), filename: 'tropicana.png')

Category.fourth.subcategories.third.brands.second.items.create! [{	title: 'Horlicks', price: '400',
                                                                   description: 'Horlicks.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/horlicks.png"), filename: 'horlicks.png')

Category.fourth.subcategories.third.brands.second.items.create! [{	title: 'B Natural', price: '65',
                                                                   description: 'B Natural.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/b_natural.png"), filename: 'b_natural.png')

Category.fifth.subcategories.first.brands.first.items.create! [{	title: 'Good Day', price: '10',
                                                                 description: 'Good Day cookies.' }]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/good_day.png"), filename: 'good_day.png')

User.create! [{ name: 'admin', email: 'admin@admin.com', phone: 8999999997, address: 'admin', password: 'admin',
                account_type: 'admin' }]
User.create! [{ name: 'Vaibhav', email: 'vsj0702@gmail.com', phone: 9129422222, address: 'Varanasi',
                password: 'password', account_type: 'normal' }]
