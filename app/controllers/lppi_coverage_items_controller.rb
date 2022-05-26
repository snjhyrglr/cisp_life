class LppiCoverageItemsController < ApplicationController
  before_action :set_lppi_coverage_item, only: %i[ show edit update destroy ]

  # GET /lppi_coverage_items or /lppi_coverage_items.json
  def index
    @lppi_coverage_items = LppiCoverageItem.all
  end

  # GET /lppi_coverage_items/1 or /lppi_coverage_items/1.json
  def show
  end

  # GET /lppi_coverage_items/new
  def new
    @lppi_coverage_item = LppiCoverageItem.new
    @lppi_coverage = @lppi_coverage_item.build_lppi_coverage
  end

  # GET /lppi_coverage_items/1/edit
  def edit
  end 

  # POST /lppi_coverage_items or /lppi_coverage_items.json
  def create
    @lppi_coverage_item = LppiCoverageItem.new(lppi_coverage_item_params)

    respond_to do |format|
      if @lppi_coverage_item.save
        format.html { redirect_to lppi_coverage_item_url(@lppi_coverage_item), notice: "Lppi coverage item was successfully created." }
        format.json { render :show, status: :created, location: @lppi_coverage_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lppi_coverage_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lppi_coverage_items/1 or /lppi_coverage_items/1.json
  def update
    respond_to do |format|
      if @lppi_coverage_item.update(lppi_coverage_item_params)
        format.html { redirect_to lppi_coverage_item_url(@lppi_coverage_item), notice: "Lppi coverage item was successfully updated." }
        format.json { render :show, status: :ok, location: @lppi_coverage_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lppi_coverage_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lppi_coverage_items/1 or /lppi_coverage_items/1.json
  def destroy
    @lppi_coverage_item.destroy

    respond_to do |format|
      format.html { redirect_to lppi_coverage_items_url, notice: "Lppi coverage item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lppi_coverage_item
      @lppi_coverage_item = LppiCoverageItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lppi_coverage_item_params
      params.require(:lppi_coverage_item).permit(:lppi_coverage_id, :member_id, :coverage, :rate_id, :prem_rate, :gross_prem, :service_fee, :net_prem)
    end
end
