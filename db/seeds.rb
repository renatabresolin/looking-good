require 'faker'

user1 = User.create!(email: Faker::Internet.email, password: 826473)
user2 = User.create!(email: Faker::Internet.email, password: 342749)
user3 = User.create!(email: Faker::Internet.email, password: 456383)
user4 = User.create!(email: Faker::Internet.email, password: 453274)
user5 = User.create!(email: Faker::Internet.email, password: 423573)


product1 = Product.create!(category: 'Pants', price: 25, user_id: user1.id, description: 'Calça capri azul')
product2 = Product.create!(category: 'Blouses', price: 30, user_id: user2.id, description: 'Blusa seda estampada')
product3 = Product.create!(category: 'Shorts', price: 15, user_id: user3.id, description: 'Short jeans' )
product4 = Product.create!(category: 'Dress', price: 35, user_id: user4.id, description: 'Vestido polka dots curto')
product5 = Product.create!(category: 'Skirt', price: 22, user_id: user5.id, description: 'Saia longa vermelha')

image1 = URI.open("https://cdn-images.farfetch-contents.com/15/23/66/49/15236649_26905151_480.jpg")
product1.photo.attach(io: image1, filename: "product_photo", content_type: "image/png")

image2 = URI.open("https://cidadejardimdigital.vteximg.com.br/arquivos/ids/578315-1000-1000/148073_001.jpg")
product2.photo.attach(io: image2, filename: "product_photo", content_type: "image/png")

image3 = URI.open("https://images.tcdn.com.br/img/img_prod/653114/short_jeans_mom_cintinho_399341431_3_20191214171150.jpg")
product3.photo.attach(io: image3, filename: "product_photo", content_type: "image/png")

image4 = URI.open("https://media.nastygal.com/i/nastygal/agg87311_yellow_xl?pdp.template")
product4.photo.attach(io: image4, filename: "product_photo", content_type: "image/png")

image5 = URI.open("https://static.dafiti.com.br/p/FiveBlu-Saia-Longa-Clean-Vermelha-5196-9847411-3-zoom.jpg")
product5.photo.attach(io: image5, filename: "product_photo", content_type: "image/png")



Rental.create!(user_id: user1.id,product_id: product1.id, returned: true)
Rental.create!(user_id: user2.id,product_id: product2.id, returned: true)
Rental.create!(user_id: user3.id,product_id: product3.id, returned: true)
Rental.create!(user_id: user4.id,product_id: product4.id, returned: true)
Rental.create!(user_id: user5.id,product_id: product5.id, returned: true)
