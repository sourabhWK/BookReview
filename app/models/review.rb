class Review < ApplicationRecord
  belongs_to :reviewer
  belongs_to :book
   
  validates :description, presence: true
  
end 