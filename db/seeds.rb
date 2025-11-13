# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



(1..5).each do |i|
  user = User.create!(
    email: "user#{i}@example.com",
    password: 'abc123',
    introduction: '自己紹介です',
    name: "User#{i}",
    gender: 1
  )

  tag = Tag.create!(name: "#{i}つ目のタグだよ〜〜")
  post = Post.create!(title: "テスト投稿#{i}", body: "これはサンプル投稿#{i}です。", status: 1, user: user)
  post.comments.create!(user: user, body: "これはテストコメント#{i}です。")
end