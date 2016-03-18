class Admin::LayoutsController < ApplicationController
   def home
      @restaurants = Restaurant.all.order(:name)
   end
end