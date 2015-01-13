class MenuGroupsController < ApplicationController
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
    respond_with(@menu_group)
  end

  def edit
  end

  def create
    @menu_group = MenuGroup.new(menu_group_params)
    @menu_group.save
    respond_with(@menu_group)
  end

  def update
    @menu_group.update(menu_group_params)
    respond_with(@menu_group)
  end

  def destroy
    @menu_group.destroy
    respond_with(@menu_group)
  end

  private
    def set_menu_group
      @menu_group = MenuGroup.find(params[:id])
    end

    def menu_group_params
       params.require(:menu_group).permit(:id, :restaurant_id, :name, :description)
    end
end
