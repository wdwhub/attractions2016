class AddOperatorTypeToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :operator_type, :string
  end
end
