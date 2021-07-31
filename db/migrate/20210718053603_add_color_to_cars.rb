class AddColorToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :color, :text
  end
end
