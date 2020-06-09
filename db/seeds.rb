# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# テストアカウント
if User.count == 0 
  User.create!(
    name: "赤坂 太郎",
    email: "a@a",
    password: "password",
    password_confirmation: "password",
    introduction: "アルコールを愛しアルコールに愛された者"
  )
end

# Userモデルを生成
if User.exists?(name: "赤坂 太郎") && User.count < 100
  99.times do |n|
    name = Faker::JapaneseMedia::OnePiece.character
    email = Faker::Internet.email
    password = "password"
    introduction = Faker::JapaneseMedia::OnePiece.akuma_no_mi
    User.create!(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
      introduction: introduction
    )
  end
end

users = User.all
stores = Store.all
check_ins = CheckIn.all

# CheckInモデルを生成
if  User.exists? && Store.exists?
  users.each do |user|
    user_id =  user.id
    stores.each do |store|
      store_id = store.id
      store_name = "test"
      open_status = true
      store_check_in = CheckIn.find_or_initialize_by(user_id: user_id, store_id: store_id) 
      if store_check_in.new_record?
        CheckIn.create!(
          user_id: user_id,
          store_id: store_id,
          store_name: store_name,
          open_status: open_status
          ) 
      end
    end
  end
end


# Joren店舗作成のためにuser_id(1)に対して、store_id(1)のcheck_inデータを20個生成
joren_check_in_count = CheckIn.where(user_id: 1, store_id: 1).count
while joren_check_in_count <= 20 do
  CheckIn.create!(
            user_id: 1,
            store_id: 1,
            store_name: "test",
            open_status: true
            )
  joren_check_in_count = CheckIn.where(user_id: 1, store_id: 1).count
end

# Joren店舗作成のためにuser_id(2)に対して、store_id(1)のcheck_inデータを20個生成
joren_check_in_count = CheckIn.where(user_id: 2, store_id: 1).count
while joren_check_in_count <= 20 do
  CheckIn.create!(
            user_id: 2,
            store_id: 1,
            store_name: "test",
            open_status: true
            )
  joren_check_in_count = CheckIn.where(user_id: 2, store_id: 1).count
end



# Commentモデルを生成
if CheckIn.exists?
  users.each do |user|
    stores.each do |store|
      check_ins.each do |check_in|
        comments = Comment.all
        comment = comments.find_or_initialize_by(check_in_id: check_in.id )
        if comment.new_record?
          comment = Comment.new
          comment.user_id = user.id 
          comment.store_id = store.id
          comment.check_in_id = check_in.id
          comment.comment = "うまい！！！！"
          comment.save!
        end
      end
    end
  end
end
  