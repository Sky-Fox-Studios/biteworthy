class Admin::LayoutsController < ApplicationController
  before_filter :authenticate_user!
  def home
    @restaurants = Restaurant.all.order(:name)
  end
end
