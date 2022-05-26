class RiderAddTpdsController < ApplicationController
  before_action :set_rider_add_tpd, only: %i[ show edit update destroy ]

  # GET /rider_add_tpds or /rider_add_tpds.json
  def index
    @rider_add_tpds = RiderAddTpd.all
  end

  # GET /rider_add_tpds/1 or /rider_add_tpds/1.json
  def show
  end

  # GET /rider_add_tpds/new
  def new
    @rider_add_tpd = RiderAddTpd.new
  end

  # GET /rider_add_tpds/1/edit
  def edit
  end

  # POST /rider_add_tpds or /rider_add_tpds.json
  def create
    @rider_add_tpd = RiderAddTpd.new(rider_add_tpd_params)

    respond_to do |format|
      if @rider_add_tpd.save
        format.html { redirect_to rider_add_tpd_url(@rider_add_tpd), notice: "Rider add tpd was successfully created." }
        format.json { render :show, status: :created, location: @rider_add_tpd }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rider_add_tpd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rider_add_tpds/1 or /rider_add_tpds/1.json
  def update
    respond_to do |format|
      if @rider_add_tpd.update(rider_add_tpd_params)
        format.html { redirect_to rider_add_tpd_url(@rider_add_tpd), notice: "Rider add tpd was successfully updated." }
        format.json { render :show, status: :ok, location: @rider_add_tpd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rider_add_tpd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rider_add_tpds/1 or /rider_add_tpds/1.json
  def destroy
    @rider_add_tpd.destroy

    respond_to do |format|
      format.html { redirect_to rider_add_tpds_url, notice: "Rider add tpd was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider_add_tpd
      @rider_add_tpd = RiderAddTpd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rider_add_tpd_params
      params.require(:rider_add_tpd).permit(:rate)
    end
end
