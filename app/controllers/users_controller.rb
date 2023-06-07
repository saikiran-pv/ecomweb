class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  # before_action :check_user_permission

  def index
    if current_user.is_admin?
      @users = User.all
    end
    if current_user.user?
      flash[:error] = "You can't access this page"
      redirect_to error_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Created #{user.role} successfully"
      redirect_to root_path
    else
      render action: "new"
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :phone_number, :email)
  end
end
