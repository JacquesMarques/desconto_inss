# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create_list(:proponent, 10) do |record|
  record.inss_discount = InssDiscountService.new(record.salary).calculate
  record.save!
end

User.create!(email: 'admin@email.com', password: '123456', password_confirmation: '123456')