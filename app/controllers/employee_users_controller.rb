class EmployeeUsersController < ApplicationController
  before_action :set_employee_user, only: %i[ show edit update destroy ]

  # GET /employee_users or /employee_users.json
  def index
    @employee_users = EmployeeUser.all
  end

  # GET /employee_users/1 or /employee_users/1.json
  def show
  end

  # GET /employee_users/new
  def new
    @employee_user = EmployeeUser.new
    @employe_profile = @employee_user.build_employee_profile
  end

  # GET /employee_users/1/edit
  def edit
    
    if @employee_user.employee_profile.present?
      @employee_profile = @employee_user.employee_profile
    else
      @employe_profile = @employee_user.build_employee_profile  
    end
  end

  # POST /employee_users or /employee_users.json
  def create
    @employee_user = EmployeeUser.new(employee_user_params)

    respond_to do |format|
      if @employee_user.save
        format.html { redirect_to employee_user_url(@employee_user), notice: "Employee user was successfully created." }
        format.json { render :show, status: :created, location: @employee_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_users/1 or /employee_users/1.json
  def update
    respond_to do |format|
      if @employee_user.update(employee_user_params)
        format.html { redirect_to employee_user_url(@employee_user), notice: "Employee user was successfully updated." }
        format.json { render :show, status: :ok, location: @employee_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_users/1 or /employee_users/1.json
  def destroy
    @employee_user.destroy

    respond_to do |format|
      format.html { redirect_to employee_users_url, notice: "Employee user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_user
      @employee_user = EmployeeUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_user_params
      params.require(:employee_user).permit(
        :username, :password,
        employee_profile_attributes: [:employee_user_id, :department_id, :division_id, :employee_no, :last_name, :first_name, :middle_name, :suffix, :birthdate]
        )
    end
end
