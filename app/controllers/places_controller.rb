class PlacesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]
    
    
    def index
        if params[:query]
            @query = params[:query]
            sql_query = " \
              name ILIKE :query \
              OR top_genre ILIKE :query \
            "
            @places = Place.select("goats.*").where(sql_query, query: "%#{params[:query]}%")

            @geocodedPlaces = Goat.select("goats.*").where(sql_query, query: "%#{params[:query]}%").geocoded
      
            @markers = display_markers(@geocodedPlaces)

        else
            @places = Place.all

            @geocodedPlaces = Place.geocoded
      
            @markers = display_markers(@geocodedPlaces)
        end
    end

    def show
        @place = Place.find(params[:id])
    end

    def new
        @place = Place.new
    end

    def create
        @place = Place.new(strong_params)
        @place.user = current_user

        if @place.save
            redirect_to place_path(@place)
        else
            render :new
        end
    end

    def edit
        @place = Place.find(params[:id])
    end

    def update
        @place = Place.find(params[:id])
        @place.update(strong_params)

        redirect_to place_path(@place)
    end

    def destroy
        @place = Place.find(params[:id])
        @place.destroy

        redirect_to places_path
    end

    private
    def strong_params
        params.require(:place).permit(:name, :top_genre, :category, :address, :url, :description, :phone_number)
    end

    def display_markers(geocoded)
        geocoded.map do |place|
            {
              lat: place.latitude,
              lng: place.longitude,
              infoWindow: render_to_string(partial: "info_window", locals: { place: place })
            }
        end
    end
end
