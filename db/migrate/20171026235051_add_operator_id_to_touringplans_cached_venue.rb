class AddOperatorIdToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :operator_id, :integer
  end
end
