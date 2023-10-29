class StatesController < ApplicationController
  before_action :set_state, only: %i[show edit update destroy]

  def index
    @states = State.all
                   .order(:name)
  end

  def show; end

  def new
    @state = State.new
  end

  def edit; end

  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to state_url(@state), notice: 'State was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to state_url(@state), notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @state.destroy!

    respond_to do |format|
      format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
      format.json { render :show, status: :ok }
    end
  end

  private

  def set_state
    @state = State.find(params[:id])
  end

  def state_params
    params.require(:state).permit(:name)
  end
end
