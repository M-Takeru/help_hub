# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

demo_email = "demo@example.com"

demo_user = User.find_or_create_by!(email: demo_email) do |u|
  u.password              = "password"
  u.password_confirmation = "password"
  u.name                  = "デモユーザー"
  u.introduction          = "ポートフォリオ確認用のデモアカウントです。自由に投稿・編集・削除して構いません。"

  u.birthday = Date.new(1995, 1, 1)
  u.gender   = :unspecified
end

puts "Demo user: #{demo_user.email} / password: password"

demo_tags = %w[
  深夜のもやもや
  仕事の不安
  人間関係の悩み
  将来のことが怖い
  誰かに聞いてほしい
]

tags = demo_tags.map do |name|
  Tag.find_or_create_by!(name: name)
end

if demo_user.posts.none?
  5.times do |i|
    post = demo_user.posts.create!(
      title: "デモ投稿 #{i + 1}",
      body:  "これはポートフォリオ確認用のデモ投稿です。自由に編集・削除して構いません。",
      status: :published
    )

    post.tags << tags.sample(2)
  end
end

puts "Demo posts created for #{demo_user.email}"