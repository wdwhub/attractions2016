class CreateCachedPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :cached_photos do |t|
      t.integer :height
      t.integer :created_at_by_epoch
      t.integer :width
      t.string :foursquare_venue_id
      t.string :prefix
      t.string :suffix
      t.string :fousquare_user
      t.string :visibility
      t.string :foursquare_photo_id

      t.timestamps
    end
  end
end
