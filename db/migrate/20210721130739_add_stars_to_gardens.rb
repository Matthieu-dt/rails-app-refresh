class AddStarsToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :stars, :integer
  end
end
