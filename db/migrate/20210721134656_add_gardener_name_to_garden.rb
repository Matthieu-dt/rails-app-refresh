class AddGardenerNameToGarden < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :gardener_name, :string
    add_column :gardens, :gardener_age, :integer
  end
end
