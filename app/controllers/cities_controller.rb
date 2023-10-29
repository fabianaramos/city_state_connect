class CitiesController < ApplicationController
  before_action :set_state
  before_action :set_city, only: %i[show edit update destroy]

  def index
    @cities = @state.cities.all
  end

  def show; end

  def new
    @city = City.new
  end

  def edit; end

  def create
    @city = @state.cities.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to state_url(@state), notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to state_city_url(@state, @city), notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy!

    respond_to do |format|
      format.html { redirect_to state_url(@state), notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_state
    @state = State.find(params[:state_id])
  end

  def set_city
    @city = @state.cities.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :state_id)
  end
end
