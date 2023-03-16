class Admin::UsersController < ApplicationController  
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :check_user_permission

  def dashboard
  end

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
      flash[:notice]="Created profile successfully"
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def update
    respond_to do |format|
      if @user.update(:name => params[:name], :role => params[:role])
        format.html { redirect_to admin_users_path, notice: "User was successfully updated." }
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice:  "User successfully destroyed"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :role, :phone_number, :address, :additional_address, :email, :store_id, :password, :password_confirmation)
    end
end

