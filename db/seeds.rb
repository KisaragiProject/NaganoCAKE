# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	Genre.create!( id: 1, name: "ケーキ", validity: true)
	Genre.create!( id: 2, name: "プリン", validity: true)
	Genre.create!( id: 3, name: "焼き菓子", validity: true)
	Genre.create!( id: 4, name: "キャンディ", validity: true)
	Genre.create!( id: 5, name: "限定", validity: true)

	Product.create!( id: 1, name: "マホイップ", introduction: "おいしいよ",
					genre_id:1,price:300,image_id:1,status: true)
	Product.create!( id: 2, name: "ププリン", introduction: "おいしいよ",
					genre_id:2,price:300,image_id:1,status: true)
	Product.create!( id: 3, name: "ヒードラン", introduction: "おいしいよ",
					genre_id:3,price:300,image_id:1,status: true)
	Product.create!( id: 4, name: "みるきー", introduction: "おいしいよ",
					genre_id:4,price:300,image_id:1,status: true)


	  Customer.create!(	id: 1, email: '1@1',
	  					family_name: "如月", family_name_kana:"きさらぎ",
	  				 	first_name: "太郎", 	first_name_kana: "たろう",
	  					post_code: "1111111",
	  					address: "危険立ち入り禁市",
	  					tel: "11111111111",
	  					is_active: true,
	  			password: "111111",
	  			password_confirmation: "111111",

	  			)

	  Customer.create!(	id: 2, email: '2@2',
	  					family_name: "如月", family_name_kana:"きさらぎ",
	  				 	first_name: "じろう", 	first_name_kana: "じろう",
	  					post_code: "2222222",
	  					address: "危険立ち入り禁市",
	  					tel: "22222222",
	  					is_active: true,
	  			password: "222222",
	  			password_confirmation: "222222",

	  			)

	  Order.create!(	id: 1, customer_id: 1,
	  					addressee: "如月三郎",
	  					post_code: "1111111",
	  					send_to_address: "危県中止",
	  					how_to_pay: "true",
	  					deliver_fee: 800,
	  					order_status: 0,
	  			)

	  Order.create!(	id: 2, customer_id: 1,
	  					addressee: "如月三郎",
	  					post_code: "1111111",
	  					send_to_address: "発県蚕糸",
	  					how_to_pay: "false",
	  					deliver_fee: 800,
	  					order_status: 1,
	  			)

	  OrderItem.create!(id: 1, order_id: 1,
	  					product_id: 1,
	  					quantity: 3,
	  					order_price: 350,
	  					make_status: 2,
	  			)

	  OrderItem.create!(id: 2, order_id: 1,
	  					product_id: 2,
	  					quantity: 4,
	  					order_price: 320,
	  					make_status: 1,
	  			)

	  OrderItem.create!(id: 3, order_id: 1,
	  					product_id: 3,
	  					quantity: 2,
	  					order_price: 310,
	  					make_status: 3,
	  			)
	  
	  OrderItem.create!(id: 4, order_id: 2,
	  					product_id: 4,
	  					quantity: 6,
	  					order_price: 500,
	  					make_status: 4,
	  			)
	  OrderItem.create!(id: 5, order_id: 2,
	  					product_id: 3,
	  					quantity: 1,
	  					order_price: 400,
	  					make_status: 0,
	  			)

	  Address.create!(id:1, customer_id:1,
	  				addressee: "如月四郎",
	  				post_code: "4444444",
	  				address: "危県中止",
	  			)

	  Address.create!(id:2, customer_id:1,
	  				addressee: "如月５郎",
	  				post_code: "5555555",
	  				address: "危県中止",
	  			)

	  Address.create!(id:3, customer_id:2,
	  				addressee: "弥生",
	  				post_code: "333333",
	  				address: "危県中止",
	  			)
	  	# Admin.create!(	id: 1, email: 'a@a',
	#   				family_name: "Admin", family_name_kana:"admin",
	#   				 first_name: "user", 	first_name_kana: "user",
	#   			password: "aaaaaa",
	#   			password_confirmation: "aaaaaa",
	#   			)

