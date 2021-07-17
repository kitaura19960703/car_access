class ChangeDataReviewToCars < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :review, :text
  end
end
