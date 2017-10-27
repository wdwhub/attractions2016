class AddHideAppToCachedAttractions < ActiveRecord::Migration[5.0]
  def change
    add_column :cached_attractions, :hide_app, :boolean
  end
end
