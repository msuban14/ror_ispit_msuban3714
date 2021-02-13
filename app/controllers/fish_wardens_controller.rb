class FishWardensController < ApplicationController
  before_action :set_licence_issuer
  before_action :set_fish_warden, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_admin!, except: [:index]

  # GET /fish_wardens or /fish_wardens.json
  def index
    @fish_wardens = @licence_issuer.fish_wardens
  end

  # GET /fish_wardens/1 or /fish_wardens/1.json
  # TODO delete show
  def show
  end

  # GET /fish_wardens/new
  def new
    @fish_warden = @licence_issuer.fish_wardens.build
  end

  # GET /fish_wardens/1/edit
  def edit
  end

  # POST /fish_wardens or /fish_wardens.json
  def create
    @fish_warden = @licence_issuer.fish_wardens.build(fish_warden_params)

    respond_to do |format|
      if @fish_warden.save
        format.html { redirect_to licence_issuer_fish_wardens_path(@licence_issuer), notice: "Fish warden was successfully created." }
        format.json { render :show, status: :created, location: @fish_warden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fish_warden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish_wardens/1 or /fish_wardens/1.json
  def update
    respond_to do |format|
      if @fish_warden.update(fish_warden_params)
        format.html { redirect_to licence_issuer_fish_wardens_path(@licence_issuer), notice: "Fish warden was successfully updated." }
        format.json { render :show, status: :ok, location: @fish_warden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fish_warden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish_wardens/1 or /fish_wardens/1.json
  def destroy
    @fish_warden.destroy
    respond_to do |format|
      format.html { redirect_to licence_issuer_fish_wardens_path(@licence_issuer), notice: "Fish warden was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_licence_issuer
      @licence_issuer =LicenceIssuer.find(params[:licence_issuer_id])
    end

    def set_fish_warden
      @fish_warden = @licence_issuer.fish_wardens.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fish_warden_params
      params.require(:fish_warden).permit(:name, :phone, :licence_issuer_id)
    end
end
