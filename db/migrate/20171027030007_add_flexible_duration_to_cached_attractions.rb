class AddFlexibleDurationToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :flexible_duration, :boolean
  end
end
