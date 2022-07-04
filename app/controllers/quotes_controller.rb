class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ edit update destroy ]

  # GET /quotes or /quotes.json
  def index
      @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
    # ctr = params[:w]
    puts params[:w]

    if params[:w] == "Approve"
      @quote = Quote.includes(quote_items: [:member]).where(quote_items: { status: "Approved" }).find(params[:id])
    elsif params[:w] == "Pending"
      @quote = Quote.includes(quote_items: [:member]).where(quote_items: { status: "Pending" }).find(params[:id])
    elsif params[:w] == "Denied"
      @quote = Quote.includes(quote_items: [:member]).where(quote_items: { status: "Denied" }).find(params[:id])
    else 
      @quote = Quote.includes(quote_items: [:member]).find(params[:id])
    end

    @approve_net_prem = QuoteItem.where(status: "Approved").sum(:net_prem)
    @approve_coverage = QuoteItem.where(status: "Approved").sum(:coverage)
    @denied_net_prem = QuoteItem.where(status: "Denied").sum(:net_prem)
    @denied_coverage = QuoteItem.where(status: "Denied").sum(:coverage)
    @pending_net_prem = QuoteItem.where(status: "Pending").sum(:net_prem)
    @pending_coverage = QuoteItem.where(status: "Pending").sum(:coverage)
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    # @lppi_remarks = @quote.lppi_remarks.build
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        
        @quote.create_quote_items_and_compute_premiums(params[:quote][:file])
        @quote.compute_total_premiums
        
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:product_id, :name, :description, :cooperative_id, :cooperative_branch_id, :file)
    end
end
