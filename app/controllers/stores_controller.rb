class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]
  # before_action :check_user_permission

  def index
    @stores = Store.all
  end

  def show
    @store=Store.find(params[:id])
    @products= @store.products
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:store_name, :description)
    end
end
