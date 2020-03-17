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

	Product.create!( id: 1, name: "マホイップ", introduction: "おいしいよ",
					genre_id:1,price:300,image_id:1,status: true)
	Product.create!( id: 2, name: "ププリン", introduction: "おいしいよ",
					genre_id:2,price:300,image_id:1,status: true)
	Product.create!( id: 3, name: "ヒードラン", introduction: "おいしいよ",
					genre_id:3,price:300,image_id:1,status: true)
	Product.create!( id: 4, name: "みるきー", introduction: "おいしいよ",
					genre_id:4,price:300,image_id:1,status: true)


	  Customer.create!(	id: 1, email: 'a@a',
	  					family_name: "如月", family_name_kana:"きさらぎ",
	  				 	first_name: "太郎", 	first_name_kana: "たろう",
	  					post_code: "1111111",
	  					address: "危立ち入り禁市",
	  					tel: "11111111111",
	  					is_active: true,
	  			password: "111111",
	  			password_confirmation: "111111",

	  			)

