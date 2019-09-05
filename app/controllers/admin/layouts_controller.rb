class Admin::LayoutsController < AdminController

  def home
    @restaurants = Restaurant.all.order(:name)
    render "layouts/home"
  end
end
