class Reviewer < User
  has_many :reviews, dependent: :destroy
  has_many :likes
end