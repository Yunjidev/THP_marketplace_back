class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]
  before_action :user_is_current_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  # GET /properties
  def index
    @properties = Property.all

    render json: @properties
  end

  # GET /properties/1
  def show
    render json: @property
  end

  # POST /properties
 # app/controllers/properties_controller.rb

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
  @property.city_id = params[:property][:city_id]
  @property.country_id = params[:property][:country_id]


  if @property.save
    render json: @property, status: :created, location: @property
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
      params.require(:property).permit(:title, :price, :description, :user_id, :image)
    end

    def user_is_current_user
      unless current_user == @property.user
        render json: { error: "Accès non autorisé" }, status: :unauthorized
      end
    end
end
