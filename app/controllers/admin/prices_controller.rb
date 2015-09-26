class Admin::PricesController < AdminController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @prices = Price.all
    respond_with(@prices)
  end

  def show
    respond_with(@price)
  end

  def new
    @price = Price.new
    respond_with(@price)
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def create
    @price = Price.new(price_params)
    redirect_to admin_prices_path
  end

  def update
    if @price.update(price_params)
      redirect_to edit_admin_price_path(@price)
    else
      redirect_to edit_admin_price_path(@price)
    end
  end

  def destroy
    @price.destroy
    redirect_to admin_prices_path
  end

  private
  def set_price
    @price = Price.find(params[:id])
    end

  def price_params
    params.require(:price).permit(:food_id, :price, :size)
    end
end
