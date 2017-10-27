class AddShowtimeProxyIdToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :showtime_proxy_id, :integer
  end
end
