class Book < ApplicationRecord
  belongs_to :writer
  has_many :reviews, dependent: :destroy
end
