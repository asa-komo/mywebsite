# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create(signin_name: 'user1',
    display_name: 'こもり',
    password: 'abcde',
    password_confirmation: 'abcde')
    
5.times do |i|
    user.posts.create(title:"title #{i}",body: "body #{i}")
end

3.times do |i|
    Post.find(1).comments.create(body: "comment body #{i}")
end