class Admin::AddressesController < AdminController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @addresses = Address.all
    respond_with(@addresses)
  end

  def new
    @address = Address.new
    respond_with(@address)
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to admin_addresses_path
    else
      redirect_to admin_addresses_path, alert: @address.errors.full_messages
    end
  end

  def update
    if @address.update(address_params)
      redirect_to admin_addresses_path
    else
      redirect_to edit_admin_address_path(@address), alert: @address.errors.full_messages
    end
  end

  def destroy
    @address.destroy
    redirect_to admin_addresses_path
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street, :city, :state, :zip, :latitute, :longitute, :restuarant_id)
    end

end
