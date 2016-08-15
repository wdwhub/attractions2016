class CreateFoursquareCachedVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :foursquare_cached_venues do |t|
      t.string :name
      t.string :foursquare_venue_id
      t.string :address
      t.string :cross_street
      t.string :lat
      t.string :lng
      t.string :alt_venues
      t.string :searched_for
      t.text :categories
      t.string :referral_id
      t.text :location
      t.text :canonical_url
      t.boolean :verified
      t.boolean :dislike
      t.boolean :ok
      t.decimal :rating
      t.string :rating_signals
      t.string :rating_color
      t.boolean :allow_menu_url_edit
      t.string :specials
      t.text :wdw_uri

      t.timestamps
    end
  end
end
