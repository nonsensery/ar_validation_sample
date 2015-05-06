class PostTag < ActiveRecord::Base
  validates :post, presence: true
  validates :tag, presence: true

  validates :tag, uniqueness: { scope: :post }

  belongs_to :post
  belongs_to :tag
end
