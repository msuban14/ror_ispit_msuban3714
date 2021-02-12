class LicenceIssuersController < ApplicationController
  before_action :set_licence_issuer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_admin!, except: [:index , :show]

  # GET /licence_issuers or /licence_issuers.json
  def index
    @licence_issuers = LicenceIssuer.all
  end

  # GET /licence_issuers/1 or /licence_issuers/1.json
  def show
    @fisheries = @licence_issuer.fisheries.order("name ASC")
  end

  # GET /licence_issuers/new
  def new
    @licence_issuer = LicenceIssuer.new
  end

  # GET /licence_issuers/1/edit
  def edit
  end

  # POST /licence_issuers or /licence_issuers.json
  def create
    @licence_issuer = LicenceIssuer.new(licence_issuer_params)

    respond_to do |format|
      if @licence_issuer.save
        format.html { redirect_to @licence_issuer, notice: "Licence issuer was successfully created." }
        format.json { render :show, status: :created, location: @licence_issuer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @licence_issuer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licence_issuers/1 or /licence_issuers/1.json
  def update
    respond_to do |format|
      if @licence_issuer.update(licence_issuer_params)
        format.html { redirect_to @licence_issuer, notice: "Licence issuer was successfully updated." }
        format.json { render :show, status: :ok, location: @licence_issuer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @licence_issuer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licence_issuers/1 or /licence_issuers/1.json
  def destroy
    @licence_issuer.destroy
    respond_to do |format|
      format.html { redirect_to licence_issuers_url, notice: "Licence issuer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_licence_issuer
      @licence_issuer = LicenceIssuer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def licence_issuer_params
      params.require(:licence_issuer).permit(:name)
    end
end
