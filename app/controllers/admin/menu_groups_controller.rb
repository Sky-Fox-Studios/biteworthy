class Admin::MenuGroupsController < AdminController
  before_action :set_menu_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menu_groups = MenuGroup.all
    respond_with(@menu_groups)
  end

  def show
    respond_with(@menu_group)
  end

  def new
    @menu_group = MenuGroup.new
    if params[:menu_group] && params[:menu_group][:restaurant_id]
      @restaurant = Restaurant.find(menu_group_params[:restaurant_id])
    end
    respond_with(@menu_group)
  end

  def edit
  end

  def create
    @menu_group = MenuGroup.new(menu_group_params)
    @menu_group.save
    redirect_to admin_menu_groups_path
  end

  def update
    binding.pry
    @menu_group.update(menu_group_params)
    redirect_to admin_menu_groups_path
  end

  def destroy
    @menu_group.destroy
    redirect_to admin_menu_groups_path
  end

  private
    def set_menu_group
      @menu_group = MenuGroup.find(params[:id])
    end

    def menu_group_params
       params.require(:menu_group).permit(:id, :restaurant_id, :name, :description, :background_color, :text_color)
    end
end
