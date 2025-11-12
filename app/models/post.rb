class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags

  enum :status, { draft: 0, published: 1, archived: 2 }
  #enum :status, {キー:値}
end
