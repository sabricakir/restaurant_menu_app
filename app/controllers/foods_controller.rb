class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new create edit]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @restaurant = Restaurant.find(params[:id])
    @food = Food.new
   end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = @restaurant.foods.new(food_params)
    respond_to do |format|
      if @food.save
        format.turbo_stream do
          render turbo_stream: [
            # new_message div'ine boş bir form ekler
            turbo_stream.update('new_food',
                                partial: 'foods/form',
                                locals: { food: Food.new,
                                          restaurant: @restaurant,
                                          current_user: }),
            turbo_stream.append(@categories.find_by(id: @food.category_id).name,
                                partial: 'foods/food',
                                locals: { food: @food })

                                 partial: 'foods/food',
                                 locals: { food: @food }),
           turbo_stream.update(@categories.find_by(id: @food.category_id).name+"_title",
                               @categories.find_by(id: @food.category_id).name),
           turbo_stream.update(@categories.find_by(id: @food.category_id).name+"_slide",
                               @categories.find_by(id: @food.category_id).name)

          ]
        end
        format.html { redirect_to restaurant_url(@restaurant), notice: 'Food was successfully created.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to restaurant_path(@restaurant)
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :price, :contents, :category_id)
  end
end
