class PlacesController < ApplicationController
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    
    def index

    end

    def show

    end
end
