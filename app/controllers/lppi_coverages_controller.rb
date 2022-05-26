class LppiCoveragesController < ApplicationController
  before_action :set_lppi_coverage, only: %i[ show edit update destroy ]

  # GET /lppi_coverages or /lppi_coverages.json
  def index
    @lppi_coverages = LppiCoverage.all
  end

  # GET /lppi_coverages/1 or /lppi_coverages/1.json
  def show
  end

  # GET /lppi_coverages/new
  def new
    @lppi_coverage = LppiCoverage.new
  end

  # GET /lppi_coverages/1/edit
  def edit
  end

  # POST /lppi_coverages or /lppi_coverages.json
  def create
    @lppi_coverage = LppiCoverage.new(lppi_coverage_params)

    respond_to do |format|
      if @lppi_coverage.save
        format.html { redirect_to lppi_coverage_url(@lppi_coverage), notice: "Lppi coverage was successfully created." }
        format.json { render :show, status: :created, location: @lppi_coverage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lppi_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lppi_coverages/1 or /lppi_coverages/1.json
  def update
    respond_to do |format|
      if @lppi_coverage.update(lppi_coverage_params)
        format.html { redirect_to lppi_coverage_url(@lppi_coverage), notice: "Lppi coverage was successfully updated." }
        format.json { render :show, status: :ok, location: @lppi_coverage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lppi_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lppi_coverages/1 or /lppi_coverages/1.json
  def destroy
    @lppi_coverage.destroy

    respond_to do |format|
      format.html { redirect_to lppi_coverages_url, notice: "Lppi coverage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lppi_coverage
      @lppi_coverage = LppiCoverage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lppi_coverage_params
      params.require(:lppi_coverage).permit(:batch_id, :cooperative_id, :cooperative_branch_id, :member_id, :product_id, :age, :effectivity, :expiry, :terms, :coverage, :gross_prem, :service_fee, :net_prem)
    end
end
