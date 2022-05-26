class RiderAdbsController < ApplicationController
  before_action :set_rider_adb, only: %i[ show edit update destroy ]

  # GET /rider_adbs or /rider_adbs.json
  def index
    @rider_adbs = RiderAdb.all
  end

  # GET /rider_adbs/1 or /rider_adbs/1.json
  def show
  end

  # GET /rider_adbs/new
  def new
    @rider_adb = RiderAdb.new
  end

  # GET /rider_adbs/1/edit
  def edit
  end

  # POST /rider_adbs or /rider_adbs.json
  def create
    @rider_adb = RiderAdb.new(rider_adb_params)

    respond_to do |format|
      if @rider_adb.save
        format.html { redirect_to rider_adb_url(@rider_adb), notice: "Rider adb was successfully created." }
        format.json { render :show, status: :created, location: @rider_adb }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rider_adb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rider_adbs/1 or /rider_adbs/1.json
  def update
    respond_to do |format|
      if @rider_adb.update(rider_adb_params)
        format.html { redirect_to rider_adb_url(@rider_adb), notice: "Rider adb was successfully updated." }
        format.json { render :show, status: :ok, location: @rider_adb }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rider_adb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rider_adbs/1 or /rider_adbs/1.json
  def destroy
    @rider_adb.destroy

    respond_to do |format|
      format.html { redirect_to rider_adbs_url, notice: "Rider adb was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider_adb
      @rider_adb = RiderAdb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rider_adb_params
      params.require(:rider_adb).permit(:rate)
    end
end
