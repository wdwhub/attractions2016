class AttractionsController < ApplicationController
  def index
  end

  # GET /attractions
  def index
    @attractions = CachedAttraction.order(name: :desc)
  end

  # GET /attractions/1
  def show
    @attraction = CachedAttraction.find(params[:id])
    @photos       = @attraction.foursquare_cached_venue.find_cached_photos
    @tips         = @attraction.foursquare_cached_venue.find_cached_tips
    
  end
  
  private
  
  # Only allow a trusted parameter "white list" through.
  def attraction_params
    params.require(:attraction).permit(:name, :permalink, :category_code, :portion_size, :cost_code, :cuisine, :phone_number, :entree_range, :when_to_go, :parking, :bar, :wine_list, :dress, :awards, :breakfast_hours, :lunch_hours, :dinner_hours, :house_specialties, :counter_quality_rating, :counter_value_rating, :table_quality_rating, :table_value_rating, :overall_rating, :service_rating, :friendliness_rating, :thumbs_up, :adult_breakfast_menu_url, :adult_lunch_menu_url, :adult_dinner_menu_url, :child_breakfast_menu_url, :child_lunch_menu_url, :child_dinner_menu_url, :requires_credit_card, :requires_pre_payment, :extinct_on, :opened_on, :disney_permalink, :code, :short_name, :accepts_tiw, :accepts_reservations, :kosher_available, :location_details, :operator_id, :operator_url, :operator_type)
  end
  
end
