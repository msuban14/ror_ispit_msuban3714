class LocationsController < ApplicationController
  before_action :set_country
  before_action :set_location, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_admin!,  except: [:index , :show]

  # GET /locations or /locations.json
  def index
    @locations = @country.locations
  end

  # GET /locations/1 or /locations/1.json
  def show
    @fishing_areas = @location.fishing_areas.order("name ASC")
  end

  # GET /locations/new
  def new
    @location = @country.locations.build
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  def create
    @location = @country.locations.build(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to country_locations_path(@country), notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to country_location_path(@country), notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to country_locations_path(@country), notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_country
      @country = Country.find(params[:country_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = @country.locations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name, :province, :country_id)
    end
end
