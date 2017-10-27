class AddAllowTimeRestrictionToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :allow_time_restriction, :boolean
  end
end
