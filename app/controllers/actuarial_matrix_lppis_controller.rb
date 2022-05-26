class ActuarialMatrixLppisController < ApplicationController
  before_action :set_actuarial_matrix_lppi, only: %i[ show edit update destroy ]

  # GET /actuarial_matrix_lppis or /actuarial_matrix_lppis.json
  def index
    @actuarial_matrix_lppis = ActuarialMatrixLppi.all
  end

  # GET /actuarial_matrix_lppis/1 or /actuarial_matrix_lppis/1.json
  def show
  end

  # GET /actuarial_matrix_lppis/new
  def new
    @actuarial_matrix_lppi = ActuarialMatrixLppi.new
  end

  # GET /actuarial_matrix_lppis/1/edit
  def edit
  end

  # POST /actuarial_matrix_lppis or /actuarial_matrix_lppis.json
  def create
    @actuarial_matrix_lppi = ActuarialMatrixLppi.new(actuarial_matrix_lppi_params)

    respond_to do |format|
      if @actuarial_matrix_lppi.save
        format.html { redirect_to actuarial_matrix_lppi_url(@actuarial_matrix_lppi), notice: "Actuarial matrix lppi was successfully created." }
        format.json { render :show, status: :created, location: @actuarial_matrix_lppi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actuarial_matrix_lppi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actuarial_matrix_lppis/1 or /actuarial_matrix_lppis/1.json
  def update
    respond_to do |format|
      if @actuarial_matrix_lppi.update(actuarial_matrix_lppi_params)
        format.html { redirect_to actuarial_matrix_lppi_url(@actuarial_matrix_lppi), notice: "Actuarial matrix lppi was successfully updated." }
        format.json { render :show, status: :ok, location: @actuarial_matrix_lppi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actuarial_matrix_lppi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actuarial_matrix_lppis/1 or /actuarial_matrix_lppis/1.json
  def destroy
    @actuarial_matrix_lppi.destroy

    respond_to do |format|
      format.html { redirect_to actuarial_matrix_lppis_url, notice: "Actuarial matrix lppi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actuarial_matrix_lppi
      @actuarial_matrix_lppi = ActuarialMatrixLppi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actuarial_matrix_lppi_params
      params.require(:actuarial_matrix_lppi).permit(:min_age, :max_age, :min_annual_prem_rate, :max_annual_prem_rate, :max_allowed_comm, :rider_add_tpd_id, :rider_adb_id)
    end
end
