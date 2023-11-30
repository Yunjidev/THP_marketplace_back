class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :user_is_current_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]
  
  # GET /properties
  def index
    @properties = Property.includes(:country).all
    
    render json: { properties: @properties, countries: @countries }
  end
  
  # GET /properties/1
  def show
    render json: @property
  end
  
  # POST /properties
  def create
    if params[:image].present?
      image = Cloudinary::Uploader.upload(params[:image])
      @property = Property.new(image: image['url'])
    else
      @property = Property.new
    end
    
    @property.title = params[:property][:title]
    @property.price = params[:property][:price]
    @property.description = params[:property][:description]
    @property.superficie = params[:property][:superficie]
    @property.user_id = params[:property][:user_id]
    @property.furnished = params[:property][:furnished]
    @property.category = params[:property][:category]
    @property.num_rooms = params[:property][:num_rooms]
  
    city = City.find_or_create_by(name: params[:property][:city].downcase)
  
    # Trouver ou créer le pays
    country = Country.find_or_create_by(name: params[:property][:country])
  
    @property.city = city
    @property.country = country  # Ajoutez cette ligne même si la ville n'est pas trouvée ou créée
  
    if @property.save
      render json: @property, status: :created, location: @property, country: country.name
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end
  
  
  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  
  
  # DELETE /properties/1
  def destroy
    @property.destroy
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:title, :price, :description, :user_id, :image, :country)
  end
  
  def user_is_current_user
    unless current_user == @property.user
      render json: { error: "Accès non autorisé" }, status: :unauthorized
    end
  end
end
