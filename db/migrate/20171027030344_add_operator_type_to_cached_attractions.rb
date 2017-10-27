class AddOperatorTypeToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :operator_type, :string
  end
end
