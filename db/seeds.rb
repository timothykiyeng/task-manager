# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Task.destroy_all
Category.destroy_all
Comment.destroy_all

require 'faker'

puts "seeding Users.........."

user1 = User.create!(name: 'Rose', email: 'rose@yahoo.com', password: '123')
user2 = User.create!(name: 'Lionel', email: 'lionel@yahoo.com', password: '012')
user3 = User.create!(name: 'Timothy', email: 'timothy@yahoo.com', password: '432')


puts "Seeding tasks..........."
40.times do
     Task.create!(
        name: Faker::Types.rb_string,
        description: Faker::Lorem.paragraph,
        completed: false,
        user_id: user3.id
    )
end

puts "Seeding categories.........."
Category.create!(title: "Laundry", task_id: 1)

puts "seeding comments......"

comment1 = Comment.create!(description: "Beautiful site", user_id: user1.id, task_id: 1)

comment2 = Comment.create!(description: "I have been able to handle my tasks properly", user_id: user2.id, task_id: 2)

comment3 = Comment.create!(description: "Handy app to input my tasks", user_id: user3.id, task_id: 2)