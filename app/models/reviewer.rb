class Reviewer < User
  has_many :reviews, dependent: :destroy
end