class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :maker_id
      t.integer :user_id
      t.integer :comment_id
      t.integer :maker
      t.integer :body_type
      t.integer :review
      t.string :car_name
      t.string :car_genre

      t.timestamps
    end
  end
end
