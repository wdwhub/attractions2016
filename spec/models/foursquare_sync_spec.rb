require 'rails_helper'

RSpec.describe FoursquareSync, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { FoursquareSync.new }
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("foursquare sync for attractions")
    end
  end
  
  describe '#collect_all_cached_attraction_venue_names_and_ids' do
    
    before do
      create_list(:cached_attraction, 25)
    end
    
    # it 'works' do
    #   expect(subject.list_all_wdw_venue_names).to eq("something")
    # end
    it 'is an Array' do
      expect(subject.collect_all_cached_attraction_venue_names_and_ids).to be_an(Array)
    end
    
    it 'has a Hash for its first element' do
      expect(subject.collect_all_cached_attraction_venue_names_and_ids.first).to be_a(Hash)
    end
    
    it 'has between 10 and 20 elements' do
      expect(subject.collect_all_cached_attraction_venue_names_and_ids.length).to be_within(10).of(20)
    end
  end

  describe '#create_or_update_cached_venue(cached_attraction_name: venue_name, cached_attraction_id: venue_id)' do
    let(:venue_name) { "Aloha Isle Refreshments" }
    let(:fsq_aloha_isle) { File.read( Rails.root + 'spec/support/shared_examples/foursquare_aloha_isle.json' ) }
    let(:fsq_aloha_isle_search) { File.read( Rails.root + 'spec/support/shared_examples/foursquare_aloha_isle_search.json' ) }
    
    before do
      # search for name
      stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=Aloha%20Isle&v=20160609").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
        to_return(:status => 200, :body => fsq_aloha_isle_search, :headers => {})
      
        # return venue with venue_Id 
        stub_request(:get, "https://api.foursquare.com/v2/venues/4b7054c3f964a52041132de3?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&v=20160609").
          with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
          to_return(:status => 200, :body => fsq_aloha_isle, :headers => {})

    end

    # works IRL
    # it 'works' do
    #   venue               = create(:cached_attraction, name: "Aloha Isle")
    #   expect(subject.create_or_update_cached_venue(cached_attraction_name: venue.name, cached_attraction_id: venue.id)).to eq("something")
    # end
  end

  describe '#create_or_update_cached_photos(venue_id:)' do
    let(:venue_id) { "4b7054c3f964a52041132de3" }
    let(:aloha_isle_photos) { File.read( Rails.root + 'spec/support/shared_examples/foursquare_aloha_isle_photos.json' ) }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/4b7054c3f964a52041132de3/photos?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&group=venue&v=20160609").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
        to_return(:status => 200, :body => aloha_isle_photos, :headers => {})
      
    end
    # it 'works' do
    #   expect(subject.create_or_update_cached_photos(venue_id: venue_id)).to eq("something")
    # end

    it 'returns an image object' do
      expect(subject.create_or_update_cached_photos(venue_id: venue_id).first).to be_a(Photo)
    end

    it 'returns an image width > 100' do
      expect(subject.create_or_update_cached_photos(venue_id: venue_id).first.width).to be > 100
    end

    it 'returns an image height > 100' do
      expect(subject.create_or_update_cached_photos(venue_id: venue_id).first.height).to be > 100
    end

    it 'returns an image prefix starting with "httpas"' do
      expect(subject.create_or_update_cached_photos(venue_id: venue_id).first.prefix).to start_with "http"
    end

    it 'returns an image suffix ending with "jpg"' do
      expect(subject.create_or_update_cached_photos(venue_id: venue_id).first.suffix).to end_with "jpg"
    end

  end
  #####################
  describe '#create_or_update_cached_tips(venue_id:)' do
    let(:venue_id) { "4b7054c3f964a52041132de3" }
    let(:aloha_isle_tips) { File.read( Rails.root + 'spec/support/shared_examples/foursquare_aloha_isle_tips.json' ) }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/4b7054c3f964a52041132de3/tips?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&v=20160609").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
        to_return(:status => 200, :body => aloha_isle_tips, :headers => {})
    end

    # it 'works' do
    #   expect(subject.create_or_update_cached_tips(venue_id: venue_id)).to eq("something")
    # end

    it 'returns an id as a String' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.id).to be_a(String)
    end

    it 'returns the text string with some length' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.text.length).to be >= 11
    end

    it 'returns an agreeCount as an Integer' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.agreeCount).to be_a(Integer)
    end

    it 'returns a disagreeCount as an Integer' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.disagreeCount).to be_a(Integer)
    end

    it 'returns a type as "user"' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.type).to eq("user")
    end

    it 'returns a created_at_boolean as an Integer' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.created_at_boolean).to be_an(Integer)
    end

    it 'returns a canonical_url as a String' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.canonical_url).to be_a(String)
    end

    it 'returns a user as a OpenStruct' do
      expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.user.first).to be_a(OpenStruct)
    end

    # it 'returns a user as a OpenStruct' do
    #   expect(subject.create_or_update_cached_tips(venue_id: venue_id).first.user.first).to be_a(OpenStruct)
    # end
    #

  end
  
end
