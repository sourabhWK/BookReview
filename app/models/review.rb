class Review < ApplicationRecord
  belongs_to :reviewer
  belongs_to :book
  has_many :likes, as: :likeable, dependent: :destroy
end 