class AddClosingRoundCodeToTouringplansCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :touringplans_cached_venues, :closing_round_code, :integer
  end
end
