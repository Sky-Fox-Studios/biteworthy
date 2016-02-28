class Admin::MenuGroupsController < AdminController
  before_action :set_restaurant, only: [:index, :all, :create, :show, :edit, :update, :destroy]
  before_action :set_menu_group, only: [:show, :edit, :update, :destroy]
  before_action :set_menu_groups, only: [:all, :index]

  respond_to :html

  def all
    @restaurants = Restaurant.all.order(:name)
  end

  def index
    @menu_groups = MenuGroup.where(restaurant_id: @restaurant).page(params[:page]).per(per_page_count)
    respond_with(@menu_groups)
  end

  def show
    respond_with(@menu_group)
  end

  def new
    @menu_group = MenuGroup.new
    if params[:restaurant_id] && params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    respond_with(@menu_group)
  end

  def edit
  end

  def create
    @menu_group = MenuGroup.new(menu_group_params)
    if @menu_group.save
      redirect_to admin_menu_groups_path(filter_restaurant_id: @menu_group.restaurant_id)
    else
      render :new
    end
  end

  def update
    if @menu_group.update(menu_group_params)
      redirect_to admin_menu_groups_path(restaurant_id: @menu_group.restaurant_id)
    else
      render :edit
    end
  end

  def destroy
    @menu_group.destroy
    redirect_to admin_menu_groups_path, alert: "Menu Group Destroyed"
  end

  private
    def set_menu_group
      @menu_group = MenuGroup.find(params[:id])
    end

    def set_menu_groups
      @page= params[:page]
      if params.has_key?(:filter_restaurant_id) && !params[:filter_restaurant_id].empty?
        @menu_groups = MenuGroup.where(restaurant_id: params[:filter_restaurant_id]).page(@page).per(per_page_count)
      else
        @menu_groups = MenuGroup.page(@page).per(per_page_count)
      end
    end

    def menu_group_params
       params.require(:menu_group).permit(:id, :restaurant_id, :name, :description, :background_color, :text_color)
    end
end
