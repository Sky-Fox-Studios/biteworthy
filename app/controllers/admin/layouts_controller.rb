class Admin::LayoutsController < AdminController

  def home
    @restaurants = Restaurant.all.order(:name)
  end
end
