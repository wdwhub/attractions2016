class AddRelativeOpenToSunsetToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :relative_open_to_sunset, :boolean
  end
end
