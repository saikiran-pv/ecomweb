class AddressesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @addresses = @user.addresses
  end

  def new
    @user = User.find(current_user.id)
    @address = Address.new
    @back = request.referrer
  end

  def create
    @user = User.find(params[:user_id])
    @address = @user.addresses.new(house: params[:house], area: params[:area], city: params[:city], zipcode: params[:zipcode], country: params[:country], user_id: current_user.id, address_type: params[:address_type])
    if @address.save
      flash[:notice] = "Address Added Successfully"
      if params[:back] && params[:back].present?
        redirect_to params[:back]
        return
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @address = @user.addresses.find(:address_id)
    @address.destroy
    redirect_to user_addresses_path, notice: "Address destroyed successfully"
  end
end
