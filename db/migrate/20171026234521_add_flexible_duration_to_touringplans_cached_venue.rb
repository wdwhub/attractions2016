class AddFlexibleDurationToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :flexible_duration, :boolean
  end
end
