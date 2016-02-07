class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#    @user = current_user

  before_action :page_history, only: [:create, :update]

   def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def page_history
    session[:return_to] ||= request.referer
  end

  def per_page_count
    25
  end

  def filter_index_by_restaurant(params, klass)
    if params.has_key?(:filter_restaurant_id) && !params[:filter_restaurant_id].empty?
      klass.constantize.where(restaurant_id: params[:filter_restaurant_id]).page(params[:page]).per(per_page_count)
    else
      klass.constantize.page(params[:page]).per(per_page_count)
    end

  end

  def set_restaurant
    if params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  end

  def set_restaurants
    @restaurants = Restaurant.all.order(:name)
  end

end
