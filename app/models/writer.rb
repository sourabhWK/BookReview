class Writer < User
  has_many :books, dependent: :destroy
end 