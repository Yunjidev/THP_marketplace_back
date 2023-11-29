class CountriesController < ApplicationController
  def index
    @countries = Country.all
    @properties = Property.includes(:country).all
    render json: @countries
  end

  def show
    @country = Country.find(params[:id])
    @properties = Property.includes(:country).where(country: @country)

    render json: { country: @country, properties: @properties }
  end

  def create
  end

  def update
  end

  def destroy
  end
end
