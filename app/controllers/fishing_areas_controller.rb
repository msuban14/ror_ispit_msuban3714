class FishingAreasController < ApplicationController
  before_action :set_fishing_area, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  before_action :is_owner_or_admin, only: [:edit, :update, :destroy]

  # GET /fishing_areas or /fishing_areas.json
  def index
    @fishing_areas = FishingArea.all.order("views DESC").paginate(page: params[:page])
  end

  # GET /fishing_areas/1 or /fishing_areas/1.json
  def show
    views = @fishing_area.views + 1
    @fishing_area.update(views: views)

    @comments = @fishing_area.comments.paginate(page: params[:page], per_page: 5)
  end

  # GET /fishing_areas/new
  def new
    @fishing_area = FishingArea.new

  end

  # GET /fishing_areas/1/edit
  def edit
    #passing countries because of form
    @countries = Country.all
  end

  # POST /fishing_areas or /fishing_areas.json
  def create
    @fishing_area = FishingArea.new(fishing_area_params)
    @fishing_area.user = current_user

    respond_to do |format|
      if @fishing_area.save
        format.html { redirect_to @fishing_area, notice: "Fishing area was successfully created." }
        format.json { render :show, status: :created, location: @fishing_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fishing_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fishing_areas/1 or /fishing_areas/1.json
  def update

      respond_to do |format|
        if @fishing_area.update(fishing_area_params)
          format.html { redirect_to @fishing_area, notice: "Fishing area was successfully updated." }
          format.json { render :show, status: :ok, location: @fishing_area }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @fishing_area.errors, status: :unprocessable_entity }
        end
      end

  end

  # DELETE /fishing_areas/1 or /fishing_areas/1.json
  def destroy
    @fishing_area.destroy
    respond_to do |format|
      format.html { redirect_to fishing_areas_url, notice: "Fishing area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishing_area
      @fishing_area = FishingArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fishing_area_params
      params.require(:fishing_area).permit(:name, :description, :thumbnail, :body_of_water_id, :country_id, :location_id, :fishery_id)
    end

    def is_owner_or_admin
      unless current_user==@fishing_area.user or current_user.admin?
        redirect_to root_path,  alert: 'Your account does not have access to this page!'
      end
    end
end
