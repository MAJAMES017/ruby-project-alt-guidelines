class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :description
      t.integer :rating
      t.integer :barber_id
      t.integer :customer_id
    end
  end
end

