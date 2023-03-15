class Admin::StoresController < ApplicationController
  before_action :check_user_permission
  before_action :set_store, only: %i[ show edit update destroy ]

  def index
    if current_user.store_admin?
      @stores = Store.where(:id => current_user.store_id)
    elsif current_user.super_admin? || current_user.staff?
      @stores = Store.all
    end
  end

  def show
    @store=Store.find(params[:id])
    @products = @store.products
  end

  def new
    @store = Store.new
  end

  def edit
    @store=Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to admin_stores_path, notice: "Store was successfully created." }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @store=Store.find(params[:id])
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to admin_stores_path, notice: "Store was successfully updated." }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store.destroy
    redirect_to admin_stores_path, notice: "Store destroyed successfully"
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.permit(:store_name, :description)
    end
end
