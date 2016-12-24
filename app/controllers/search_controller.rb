class SearchController < ApplicationController
   def home
      @restaurants = Restaurant.where(active: true).order(:name)

   end
end
