class BaseController < ApplicationController
   def home
      @restaurants = Restaurant.all.order(:name)

      
   end
end
