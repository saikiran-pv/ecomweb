class AddressesController < ApplicationController
    def index
        @user=User.find(current_user.id)
        @addresses= @user.addresses
    end

    def new
        @user = User.find(current_user.id)
        @address = Address.new
    end

    def create
        @user=User.find(params[:user_id])
        @address = @user.addresses.new(:house => params[:house], :area => params[:area],:city => params[:city],:zipcode => params[:zipcode],:country => params[:country], :user_id => current_user.id, :address_type => params[:address_type])
        if @address.save
            redirect_to checkout_path, notice: "Address added successfully."
        else
            render :new 
        end
    end

end