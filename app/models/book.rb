class Book < ApplicationRecord
  belongs_to :writer
  has_many :reviews, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
