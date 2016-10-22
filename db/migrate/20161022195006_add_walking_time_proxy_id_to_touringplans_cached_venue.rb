class AddWalkingTimeProxyIdToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :walking_time_proxy_id, :integer
  end
end
