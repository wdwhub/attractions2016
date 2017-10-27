class AddClosingRoundCodeToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :closing_round_code, :integer
  end
end
