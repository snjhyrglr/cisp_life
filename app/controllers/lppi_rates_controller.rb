class LppiRatesController < ApplicationController
  before_action :set_lppi_rate, only: %i[ show edit update destroy ]

  # GET /lppi_rates or /lppi_rates.json
  def index
    @lppi_rates = LppiRate.all
  end

  # GET /lppi_rates/1 or /lppi_rates/1.json
  def show
  end

  # GET /lppi_rates/new
  def new
    @lppi_rate = LppiRate.new
  end

  # GET /lppi_rates/1/edit
  def edit
  end

  # POST /lppi_rates or /lppi_rates.json
  def create
    @lppi_rate = LppiRate.new(lppi_rate_params)

    respond_to do |format|
      if @lppi_rate.save
        format.html { redirect_to lppi_rate_url(@lppi_rate), notice: "Lppi rate was successfully created." }
        format.json { render :show, status: :created, location: @lppi_rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lppi_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lppi_rates/1 or /lppi_rates/1.json
  def update
    respond_to do |format|
      if @lppi_rate.update(lppi_rate_params)
        format.html { redirect_to lppi_rate_url(@lppi_rate), notice: "Lppi rate was successfully updated." }
        format.json { render :show, status: :ok, location: @lppi_rate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lppi_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lppi_rates/1 or /lppi_rates/1.json
  def destroy
    @lppi_rate.destroy

    respond_to do |format|
      format.html { redirect_to lppi_rates_url, notice: "Lppi rate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lppi_rate
      @lppi_rate = LppiRate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lppi_rate_params
      params.require(:lppi_rate).permit(:min_age, :max_age, :min_coverage, :max_coverage, :min_annual_rate, :max_annual_rate, :min_monthly_rate, :max_monthly_rate, :max_allowed_comm, :add_tpd_annual_id, :rider_add_tpd_id, :add_tpd_rate, :rider_adb_id, :adb_rate)
    end
end
