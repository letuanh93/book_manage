# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |n|
  name  = "User #{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create name: name,
    email: email,
    password: password,
    password_confirmation: password
end

users = User.all
user  = users.first
following = users[2..20]
followers = users[3..20]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

30.times do |n|
	Name = "Category111 #{n+1}"
	Description = "No #{n+1}"
	Category.create Name: Name,
	Description: Description
end