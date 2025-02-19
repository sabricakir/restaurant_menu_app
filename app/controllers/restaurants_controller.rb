class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]
  def qr_code_generator; end

    def qr_code_download
      send_data RQRCode::QRCode.new(params[:content].to_s).as_png(size: 300), type: 'image/png', disposition: 'inline'
    end
  # GET /restaurants or /restaurants.json

  # GET /restaurants/1 or /restaurants/1.json
  def index
    sleep(1)
    @user = current_user
  end
  def show
    @user = current_user
    @categories = Category.all
    @restaurant_link = "https://restaurant-qr-menu.herokuapp.com/restaurants/" + @restaurant.id.to_s
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to user_restaurant_url(@restaurant.user, @restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to user_restaurant_url(@restaurant.user, @restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to user_restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :restaurant_image, :address)
    end
end
