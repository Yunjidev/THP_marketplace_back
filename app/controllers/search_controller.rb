class SearchController < ApplicationController
    def index
      term = params[:term]
      @results = Property.where('country_name ILIKE ? OR city_name ILIKE ?', "%#{term}%", "%#{term}%")
      render json: @results
    end
  end