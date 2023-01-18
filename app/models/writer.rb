class Writer < User
  has_many :books, dependent: :destroy
  has_many :likes
end 