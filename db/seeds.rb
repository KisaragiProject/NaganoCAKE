# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	Admin.create!( id: 1, email:'q@p',
				  password: "333333",
				  password_confirmation: "333333"
	             )

	Genre.create!( id: 1, name: "ケーキ", validity: true)
	Genre.create!( id: 2, name: "プリン", validity: true)
	Genre.create!( id: 3, name: "焼き菓子", validity: true)
	Genre.create!( id: 4, name: "キャンディ", validity: true)
	Genre.create!( id: 5, name: "限定", validity: true)

	Product.create!(name: "マホイップ", introduction: "右の頬を殴られたら
		左の頬を差し出せ",genre_id:1,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product1.jpg"))
	Product.create!( name: "ププリン", introduction: "どどうどう、どどうどう",
					genre_id:2,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product2.jpg"))
	Product.create!( name: "ヒードラン", introduction: "トンネルを抜けると雪国だった",
					genre_id:3,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product3.jpg"))
	Product.create!( name: "カモネギ", introduction: "次の千年の恋人
		たちに誰も説いたことない謎を残そう",
					genre_id:4,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product4.jpg"))
	Product.create!( name: "ピカチュウ", introduction: "ねこはいます",
					genre_id:2,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product5.jpg"))
	Product.create!( name: "カイリュー", introduction: "いぬはいません",
					genre_id:3,price:500,image_id:1,status: true,
					image: File.open("./app/assets/images/product6.jpg"))
	Product.create!( name: "ヤドラン", introduction: "祇園精舎の時の声
		書状無行の響きあり",
					genre_id:4,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product7.jpg"))
	Product.create!( name: "ピジョン", introduction: "メロスは激怒した、
		必ずやかの邪智暴虐な暴君を除かねばならぬと決意した",
					genre_id:5,price:2000,image_id:1,status: true,
					image: File.open("./app/assets/images/product8.jpg"))
	Product.create!( name: "コダック", introduction: "吾輩は猫である",
					genre_id:1,price:700,image_id:1,status: true,
					image: File.open("./app/assets/images/product9.jpg"))
	Product.create!( name: "コラッタ", introduction: "人間は考えるアシである",
					genre_id:2,price:300,image_id:1,status: true,
					image: File.open("./app/assets/images/product10.jpg"))
	Product.create!( name: "ズバッと", introduction: "我思うゆえに我あり",
					genre_id:3,price:600,image_id:1,status: false,
					image: File.open("./app/assets/images/product11.jpg"))
	Product.create!( name: "ギャロップ", introduction: "はろー",
					genre_id:4,price:500,image_id:1,status: true,
					image: File.open("./app/assets/images/product12.jpg"))

20.times do |n|
Product.create!(name: "量産型ケーキ#{n}", introduction: "とりあえず20作りました",
genre_id:1,price:334,image_id:1,status: true,
image: File.open("./app/assets/images/product3.jpg"))
end

20.times do |n|
Product.create!(name: "量産型プリン#{n}", introduction: "とりあえず20作りました",
genre_id:2,price:334,image_id:1,status: true,
image: File.open("./app/assets/images/product10.jpg"))
end

20.times do |n|
Product.create!(name: "量産型焼き菓子#{n}", introduction: "とりあえず20作りました",
genre_id:3,price:334,image_id:1,status: true,
image: File.open("./app/assets/images/product1.jpg"))
end

20.times do |n|
Product.create!(name: "量産型キャンディ#{n}", introduction: "とりあえず20作りました",
genre_id:4,price:334,image_id:1,status: true,
image: File.open("./app/assets/images/product2.jpg"))
end
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
	  					family_name: "検証", family_name_kana:"けんしょう",
	  				 	first_name: "かすたま", 	first_name_kana: "かすたま",
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
	  					send_to_address: "遊明県鳥窪町",
	  					how_to_pay: "true",
	  					deliver_fee: 800,
	  					order_status: 2,
	  			)

	  Order.create!(	id: 2, customer_id: 1,
	  					addressee: "如月三郎",
	  					post_code: "1111111",
	  					send_to_address: "広原県清浦市",
	  					how_to_pay: "false",
	  					deliver_fee: 800,
	  					order_status: 1,
	  					created_at: "2019-07-11 02:13:55"
	  			)
	  Order.create!(	id: 3, customer_id: 2,
	  					addressee: "如月4郎",
	  					post_code: "1111111",
	  					send_to_address: "遊明県鳥窪町",
	  					how_to_pay: "true",
	  					deliver_fee: 800,
	  					order_status: 3,
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
	  OrderItem.create!(id: 6, order_id: 3,
	  					product_id: 5,
	  					quantity: 1,
	  					order_price: 600,
	  					make_status: 1,
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
	  				addressee: "このひとは",
	  				post_code: "5555555",
	  				address: "見えちゃダメ",
	  			)
	 CartItem.create!(id: 1, customer_id: 1,
	  					product_id: 1,
	  					quantity: 3,
	  					)
	 CartItem.create!(id: 2, customer_id: 1,
	  					product_id: 3,
	  					quantity: 3,
	  					)
	 CartItem.create!(id: 3, customer_id: 2,
	  					product_id: 4,
	  					quantity: 1,
	  					)
