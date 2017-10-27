class AddHideAppToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :hide_app, :boolean
  end
end
