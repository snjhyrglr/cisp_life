class CooperativeMatricesController < ApplicationController
  before_action :set_cooperative_matrix, only: %i[ show edit update destroy ]

  # GET /cooperative_matrices or /cooperative_matrices.json
  def index
    @cooperative_matrices = CooperativeMatrix.all
  end

  # GET /cooperative_matrices/1 or /cooperative_matrices/1.json
  def show
    min_age = CooperativeMatrix.find(params[:id]).entry_age_max
    max_age = CooperativeMatrix.find(params[:id]).exit_age
    @over_age = Rate.where(min_age: min_age.., max_age: ..max_age)
    @max_cov = Rate.where(min_age: min_age.., max_age: ..max_age).maximum(:max_coverage)
    # puts @over_age.length
  end

  # GET /cooperative_matrices/new
  def new
    @cooperative_matrix = CooperativeMatrix.new
  end

  # GET /cooperative_matrices/1/edit
  def edit
  end

  # POST /cooperative_matrices or /cooperative_matrices.json
  def create
    @cooperative_matrix = CooperativeMatrix.new(cooperative_matrix_params)
    
    respond_to do |format|
      if @cooperative_matrix.save

        flash[:success] = "Coop Rate Successfully added."
        format.html { redirect_to cooperative_matrix_url(@cooperative_matrix)}
        format.json { render :show, status: :created, location: @cooperative_matrix }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cooperative_matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooperative_matrices/1 or /cooperative_matrices/1.json
  def update
    respond_to do |format|
      if @cooperative_matrix.update(cooperative_matrix_params)
        format.html { redirect_to cooperative_matrix_url(@cooperative_matrix), notice: "Cooperative matrix was successfully updated." }
        format.json { render :show, status: :ok, location: @cooperative_matrix }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cooperative_matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooperative_matrices/1 or /cooperative_matrices/1.json
  def destroy
    @cooperative_matrix.destroy

    respond_to do |format|
      format.html { redirect_to cooperative_matrices_url, notice: "Cooperative matrix was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooperative_matrix
      @cooperative_matrix = CooperativeMatrix.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cooperative_matrix_params
      params.require(:cooperative_matrix).permit(:cooperative_id, :cooperative_incharge, :incharge_position, :premium_rate, :coop_service_fee, :lppi_rate_id, :add_tpd_enable, :add_tpd_rate, :adb_enable, :adb_rate, :total_premium_rate, :entry_age_min, :entry_age_max, :exit_age, :NEL, :NML, :min_borrowers)
    end
end
