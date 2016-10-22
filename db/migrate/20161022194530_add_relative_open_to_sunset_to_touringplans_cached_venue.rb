class AddRelativeOpenToSunsetToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :relative_open_to_sunset, :boolean
  end
end
