class AddPermalinkToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :permalink, :string
  end
end
