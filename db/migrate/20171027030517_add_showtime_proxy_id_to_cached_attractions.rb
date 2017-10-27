class AddShowtimeProxyIdToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :showtime_proxy_id, :integer
  end
end
