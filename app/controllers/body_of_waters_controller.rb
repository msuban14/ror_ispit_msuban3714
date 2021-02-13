class BodyOfWatersController < ApplicationController
  before_action :set_body_of_water, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_admin!, except: [:index, :show]
  # GET /body_of_waters or /body_of_waters.json
  def index
    @body_of_waters = BodyOfWater.all
  end

  # GET /body_of_waters/1 or /body_of_waters/1.json
  def show
    #pass fishing areas associated
    @fishing_areas = @body_of_water.fishing_areas.order("name ASC")
  end

  # GET /body_of_waters/new
  def new
    @body_of_water = BodyOfWater.new
  end

  # GET /body_of_waters/1/edit
  def edit
  end

  # POST /body_of_waters or /body_of_waters.json
  def create
    @body_of_water = BodyOfWater.new(body_of_water_params)

    respond_to do |format|
      if @body_of_water.save
        format.html { redirect_to @body_of_water, notice: "Body of water was successfully created." }
        format.json { render :show, status: :created, location: @body_of_water }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @body_of_water.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /body_of_waters/1 or /body_of_waters/1.json
  def update
    respond_to do |format|
      if @body_of_water.update(body_of_water_params)
        format.html { redirect_to @body_of_water, notice: "Body of water was successfully updated." }
        format.json { render :show, status: :ok, location: @body_of_water }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @body_of_water.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_of_waters/1 or /body_of_waters/1.json
  def destroy
    @body_of_water.destroy
    respond_to do |format|
      format.html { redirect_to body_of_waters_url, notice: "Body of water was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body_of_water
      @body_of_water = BodyOfWater.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def body_of_water_params
      params.require(:body_of_water).permit(:name,:description,:water_type)
    end
end
