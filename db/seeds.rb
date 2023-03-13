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

#Loading Category data in the database.
Category.create! [
	{name: "Fruits/Vegetable"},
	{name: "Meat/Fish"},
	{name: "Bread/Diary"},
	{name: "Beverages"},
	{name: "Groceries"}
]

Category.first.subcategories.create! [ 
	{name: "Fruits"},
	{name: "Vegetable"},
	{name: "Cuts & sprouts"}
] 

Category.second.subcategories.create! [ 
	{name: "Meat"},
	{name: "Fish"}
] 

Category.third.subcategories.create! [ 
	{name: "Bread"},
	{name: "Dairy"}
] 

Category.fourth.subcategories.create! [ 
	{name: "Soft drinks	"},
	{name: "Tea & Coffee"},
	{name: "Energy/Health drinks"}
] 

Category.fifth.subcategories.create! [ 
	{name: "Biscuits"}
] 


Category.first.subcategories.first.brands.create! [{name: "Basketor"}]

Category.first.subcategories.second.brands.create! [{name: "Eveg"}]

Category.first.subcategories.third.brands.create! [{name: "Earthbound Organics"}]


Category.second.subcategories.first.brands.create! [{name: "Wakao Foods"}]


Category.second.subcategories.second.brands.create! [{name: "C Shore Foods"}]

Category.third.subcategories.first.brands.create! [{name: "Modern"}]

Category.third.subcategories.second.brands.create! [{name: "Amul"}]

Category.fourth.subcategories.first.brands.create! [
	{name: "Pepsi"},
	{name: "Coke"}
]

Category.fourth.subcategories.second.brands.create! [{name: "Nestle"}]

Category.fourth.subcategories.third.brands.create! [
	{name: "Tropicana"},
	{name: "Hindustan Unilever"},
	{name: "ITC"}
]

Category.fifth.subcategories.first.brands.create! [{name: "Britannia"}]


Category.first.subcategories.first.brands.first.items.create! [{	title: "Apple", price: "140", description: "Baby Apples are the mini blush red apples with slight yellow streaks and has a smooth texture. The apple flesh is greenish white and grained, and it tastes sweet and juicy. The crispiness and the aroma of the apples make it more attractive. Apples are best when it is consumed fresh after meals or as a healthy snack for kids."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/apple.png"), filename: 'apple.png')

Category.first.subcategories.first.brands.first.items.create! [{	title: "Raspberry", price: "20", description: "The raspberry is the edible fruit of a multitude of plant species in the genus Rubus of the rose family, most of which are in the subgenus Idaeobatus."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/raspberry.png"), filename: 'raspberry.png')

Category.first.subcategories.second.brands.first.items.create! [{	title: "Onions", price: "10", description: "An onion also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/onion.png"), filename: 'onion.png')

Category.first.subcategories.third.brands.first.items.create! [{	title: "Bean Sprouts", price: "20", description: "Mung bean sprouts are a culinary vegetable grown by sprouting mung beans. They can be grown by placing and watering the sprouted beans in the shade."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/sprouts.png"), filename: 'sprouts.png')

Category.second.subcategories.first.brands.first.items.create! [{	title: "Chicken", price: "250", description: "Chicken is the most common type of poultry in the world."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/chicken.png"), filename: 'chicken.png')

Category.second.subcategories.second.brands.first.items.create! [{	title: "Cod", price: "50", description: "Cod is popular as a food with a mild flavour and a dense, flaky, white flesh. Cod livers are processed to make cod liver oil, a common source of vitamin A."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/cod.png"), filename: 'cod.png')

Category.third.subcategories.first.brands.first.items.create! [{	title: "Atta Bread", price: "17", description: "Whole wheat bread or wholemeal bread is a type of bread made using flour that is partly or entirely milled from whole or almost-whole wheat grains"}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/bread.png"), filename: 'bread.png')

Category.third.subcategories.second.brands.first.items.create! [{	title: "Amul Milk", price: "32", description: "Milk is a white liquid food produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/bread.png"), filename: 'bread.png')

Category.fourth.subcategories.first.brands.first.items.create! [{	title: "Pepsi", price: "40", description: "Pepsi is the pop that shakes things up! Pepsi is ubiquitous on just about every social occasion. Also known to be a Party Starter. Pepsi is one of the most favourite drinks of the world - be it any happy occasion or to brighten up your mood. Pepsi has been bringing smiles to generations of Indians and continues to do so - be it those happy get together or birthday party. Pepsi is your stay happy mascot and companion. Drink Pepsi and bring a smile to your face."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/pepsi.png"), filename: 'pepsi.png')

Category.fourth.subcategories.first.brands.second.items.create! [{	title: "Coke", price: "40", description: "Delight your guests with Coca Cola. It is the perfect drink for any weather. Gatherings are incomplete without it. One glass is never enough! So go ahead buy this product online today."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/coke.png"), filename: 'coke.png')

Category.fourth.subcategories.second.brands.first.items.create! [{	title: "Nestle Everyday Tea", price: "10", description: "Nestle Everyday is a dairy whitener or dried milk powder that mixes in completely with your tea to lift its taste - so you get a thicker & tastier cup of tea, every time. We at nestle use milk of the highest quality and use our international dairy know-how to carefully dry and balance this milk powder without losing any of its goodness, so that you and your family can enjoy a thicker, milkier, tastier cup of tea - with Everyday, tea's perfect partner! Did you know that Everyday is the no.1 selling dairy whitener in the country? It’s no wonder then, that in blind taste tests consumers ranked tea made with everyday milk powder as their no.1 choice for a perfect cup of tea! It produces 401 kcal of energy."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/tea.png"), filename: 'tea.png')

Category.fourth.subcategories.second.brands.first.items.create! [{	title: "Nestle Coffee", price: "140", description: "To take your coffee experiences to the next level, Nescafe, the world's favourite instant coffee brand, brings forth a rich and aromatic coffee in the form of Nescafe Classic. The unmistakable flavour of Nescafe Classic is what makes this signature coffee so loved all over the world. Start your day right with the first sip of this classic 100% pure coffee and let the intense taste and wonderfully refreshing aroma of Nescafe instant coffee awaken your senses to new opportunities. With over 75 years of experience and working with coffee farmers, to help them grow more sustainable coffee through improved crop techniques, we deliver the best coffee produced by the best selecting, roasting and blending methods."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/coffee.png"), filename: 'coffee.png')

Category.fourth.subcategories.third.brands.first.items.create! [{	title: "Tropicana Orange", price: "140", description: "100% orange juice with no added sugar for a healthy you No added preservatives, colour or artificial flavouring. Just goodness of oranges Relish the goodness of hand-picked oranges from the finest orchards."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/tropicana.png"), filename: 'tropicana.png')

Category.fourth.subcategories.third.brands.second.items.create! [{	title: "Horlicks", price: "400", description: "Horlicks is a Health Drink that has nutrients to support immunity, clinically proven to improve 5 signs of growth to make kids taller, stronger and sharper."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/horlicks.png"), filename: 'horlicks.png')

Category.fourth.subcategories.third.brands.second.items.create! [{	title: "B Natural", price: "65", description: "B Natural Guava Juice is made with 100% Indian fruits, and contains 0% Concentrate. Relish the wholesomeness of natural fruit juice and the goodness of fiber with B Natural Guava Juice. This refreshing fruity beverage is an ideal accompaniment on a hot afternoon. With each sip of B Natural Guava Juice, you can revitalize your mind and body with its rich flavour."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/b_natural.png"), filename: 'b_natural.png')

Category.fifth.subcategories.first.brands.first.items.create! [{	title: "Good Day", price: "10", description: "Britannia Good Day Cashew Cookies are delicious crunchy cookies made with rich cashews. These melt-in-mouth cookies with their delicious nutty taste are perfect with a cup of tea or to satisfy those mid-meal hunger pangs. Britannia biscuits, cookies, cakes and rusk are a perfect companion for your tea. Believing in delivering wholesome and delicious products, Britannia India manufactures some of India's favourite brands like 50-50, Tiger, NutriChoice, Bourbon, Milk Bikis and Marie Gold."}]
Item.last.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/good_day.png"), filename: 'good_day.png')


User.create! [{name: "admin" , email: "admin@admin.com" , phone: 8999999997 , address: "admin", password: "admin" , account_type: "admin"}]
User.create! [{name: "Vaibhav" , email: "vsj0702@gmail.com" , phone: 9129422222 , address: "Varanasi", password: "password" , account_type: "normal"}]