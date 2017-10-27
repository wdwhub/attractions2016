class AddWalkingTimeProxyIdToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :walking_time_proxy_id, :integer
  end
end
