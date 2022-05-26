class CooperativeBranchesController < ApplicationController
  before_action :set_cooperative_branch, only: %i[ show edit update destroy ]

  # GET /cooperative_branches or /cooperative_branches.json
  def index
    # @cooperative_branches = CooperativeBranch.all
    @cooperative_branches = CooperativeBranch.paginate(page: params[:page], per_page: 20)
  end

  # GET /cooperative_branches/1 or /cooperative_branches/1.json
  def show
  end

  def selected 
    @target = params[:target] 
    @members = Member.where(cooperative_branch_id: params[:id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  # GET /cooperative_branches/new
  def new
    @cooperative_branch = CooperativeBranch.new
  end

  # GET /cooperative_branches/1/edit
  def edit
  end

  # POST /cooperative_branches or /cooperative_branches.json
  def create
    @cooperative_branch = CooperativeBranch.new(cooperative_branch_params)

    respond_to do |format|
      if @cooperative_branch.save
        format.html { redirect_to cooperative_branch_url(@cooperative_branch), notice: "Cooperative branch was successfully created." }
        format.json { render :show, status: :created, location: @cooperative_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cooperative_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooperative_branches/1 or /cooperative_branches/1.json
  def update
    respond_to do |format|
      if @cooperative_branch.update(cooperative_branch_params)
        format.html { redirect_to cooperative_branch_url(@cooperative_branch), notice: "Cooperative branch was successfully updated." }
        format.json { render :show, status: :ok, location: @cooperative_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cooperative_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooperative_branches/1 or /cooperative_branches/1.json
  def destroy
    @cooperative_branch.destroy

    respond_to do |format|
      format.html { redirect_to cooperative_branches_url, notice: "Cooperative branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooperative_branch
      @cooperative_branch = CooperativeBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cooperative_branch_params
      params.require(:cooperative_branch).permit(:cooperative_id, :name, :address)
    end
end
