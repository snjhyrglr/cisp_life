class LppiRemarksController < ApplicationController
  before_action :set_lppi_remark, only: %i[ show edit update destroy ]

  # GET /lppi_remarks or /lppi_remarks.json
  def index
    @lppi_remarks = LppiRemark.all
  end

  # GET /lppi_remarks/1 or /lppi_remarks/1.json
  def show
    if params[:q]
      @lppi_remark = LppiRemark.find_by(quote_id: params[:q], quote_item_id: params[:qi])
    else
      @lppi_remark = LppiRemark.find(params[:id])
    end
    
  end

  # GET /lppi_remarks/new
  def new
    @lppi_remark = LppiRemark.new
    # @quote_item = QuoteItem.find(params[:qi])
    # @lppi_remark = @quote_item.lppi_remarks.build
    
  end

  # GET /lppi_remarks/1/edit
  def edit
  end

  # POST /lppi_remarks or /lppi_remarks.json
  def create
    @lppi_remark = LppiRemark.new(lppi_remark_params)
    @lppi_remark.quote_id = params[:q]
    @lppi_remark.quote_item_id = params[:qi]

    # @quote_item = @lppi_remark.new(lppi_remark_params)

    respond_to do |format|
      if @lppi_remark.save
        # format.html { redirect_to lppi_remark_url(@lppi_remark), notice: "Lppi remark was successfully created." }
        format.html { redirect_to quote_item_pending_path(q: params[:q], qi: params[:qi]) }
        format.json { render :show, status: :created, location: @quote_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote_item.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lppi_remarks/1 or /lppi_remarks/1.json
  def update
    respond_to do |format|
  
      if @lppi_remark.update(lppi_remark_params)
        format.html { redirect_to lppi_remark_url(@lppi_remark), notice: "Lppi remark was successfully updated." }
        format.json { render :show, status: :ok, location: @lppi_remark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lppi_remark.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lppi_remarks/1 or /lppi_remarks/1.json
  def destroy
    @lppi_remark.destroy

    respond_to do |format|
      format.html { redirect_to lppi_remarks_url, notice: "Lppi remark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lppi_remark
      @lppi_remark = LppiRemark.find(params[:id])
      # @quote_item = QuoteItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lppi_remark_params
      params.require(:lppi_remark).permit(:quote_item_id, :quote_id, :remarks)
    end

    def quote_item_params
      params.require(:quote_item).permit(
        lppi_remarks_attributes: [:remarks]
        )
    end
end
