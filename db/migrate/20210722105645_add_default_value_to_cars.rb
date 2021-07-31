class AddDefaultValueToCars < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :star, :float, default: 0, null: false
  end
end
