class Admin::UsersController < ApplicationController
  layout "super_admin_layout"
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="Created #{user.role} successfully"
      redirect_to super_admin_users_path
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
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
      params.require(:user).permit(:name, :role, :phone_number, :address, :additional_address, :email, :store_name)
    end
    #   if @user.super_admin?
    #     params.require(:user).permit(:name, :role, :phone_number, :address, :additional_address, :email, :store_name)
    #   elsif @user.store_admin?
    #     params.require(:user).permit(:name, :role, :phone_number, :address, :additional_address, :email, :store_name)
    #   elsif @user.staff?
    #     params.require(:user).permit(:name, :role, :phone_number, :address, :additional_address, :email)
    #   else
    #     params.require(:user).permit(:name, :role, :phone_number, :address, :additional_address, :email)
    #   end
    # end
end

