class AdminsController < ApplicationController
  layout "super_admin_layout"
  before_action :set_user, only: %i[ show edit update destroy ]
  # before_action :authorize_admin_access

  def authenticate
    render layout: 'simple_layout'
    @user = User.new
  end

  def dashboard
    render layout: 'super_admin_layout'
  end

  def validate
    @user=User.find_by(email: params[:email])
    if @user.role == "super_admin"
      if params[:super_admin_code] == "71498"
        # flash[:notice]="Authenticated SuperAdmin successfully!"
        redirect_to super_admin_dashboard_path
      # else
        # flash[:error]="Incorrect code"
        # render :authenticate
      end
    # else
      # flash[:alert]="Profile doesn't exist!"
      # redirect_to new_user_session_path
    end
  end
end
  
  