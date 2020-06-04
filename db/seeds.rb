# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Userモデルを生成
# 100.times do |n|
#   name = Faker::JapaneseMedia::OnePiece.character
#   email = Faker::Internet.email
#   password = "password"
#   introduction = Faker::JapaneseMedia::OnePiece.akuma_no_mi
#   User.create!(
#     name: name,
#     email: email,
#     password: password,
#     password_confirmation: password,
#     introduction: introduction
#   )
# end

users = User.all

# CheckInモデルを生成
# users.each do |user|
#   user_id =  user.id
#   store_id = 1
#   store_name = "ぶっちぎり酒場 渋谷スペイン坂店"
#   open_status = true
#   CheckIn.create!(
#     user_id: user_id,
#     store_id: store_id,
#     store_name: store_name,
#     open_status: open_status
#   )
# end


# # Commentモデルを生成
# users.each do |user|
#   check_ins = user.check_ins
#   check_ins.each do |check_in|
#     user_id = user.id
#     store_id = 1
#     check_in_id = check_in.id    
#     comment = "うまい！！！"
#     Comment.create!(
#       user_id: user_id,
#       store_id: store_id,
#       check_in_id: check_in_id,
#       comment: comment  
#     )
#   end
# end
  