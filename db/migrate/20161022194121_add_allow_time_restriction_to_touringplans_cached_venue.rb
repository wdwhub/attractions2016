class AddAllowTimeRestrictionToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :allow_time_restriction, :boolean
  end
end
