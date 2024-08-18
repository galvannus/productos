# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.destroy_all
Product.create!(
  [
    {
      name: 'Green Chilli',
      price: 15,
      sku: "1",
      is_seasonal: false,
      image: "uploads/product_images/apricot.webp",
      quantity: "100 gms",
      category: "vegetables"
    },{
      name: 'Ash Gourd',
      price: 55,
      sku: "2",
      is_seasonal: false,
      image: "uploads/product_images/ash-gourd.jpg",
      quantity: "1 kg",
      category: "vegetables"
    },{
      name: 'Corn',
      price: 30,
      sku: "9",
      is_seasonal: true,
      image: "uploads/product_images/corn.jpg",
      quantity: "1 piece",
      category: "vegetables"
    },{
      name: 'Apple',
      price: 150,
      sku: "21",
      is_seasonal: false,
      image: "uploads/product_images/apple.jpg",
      quantity: "1 kg",
      category: "fruits"
    },{
      name: 'Apricot',
      price: 55,
      sku: "22",
      is_seasonal: false,
      image: "uploads/product_images/apricot.webp",
      quantity: "1 kg",
      category: "fruits"
    },{
      name: 'Banana',
      price: 20,
      sku: "23",
      is_seasonal: false,
      image: "uploads/product_images/banana.jpeg",
      quantity: "2 pieces",
      category: "fruits"
    }
  ]
)