class AddRelativeCloseToSunsetToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :relative_close_to_sunset, :boolean
  end
end
