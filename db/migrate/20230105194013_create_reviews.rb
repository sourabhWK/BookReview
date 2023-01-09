class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :reviewer_id
      t.belongs_to :book

      t.timestamps
    end
  end
end 
