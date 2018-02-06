class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_user
    @tag_reviews = Review.tag_reviews(current_user).order_desc
    @item_reviews = Review.item_reviews(current_user).order_desc
    @restaurant_reviews = Review.restaurant_reviews(current_user).order_desc
  end

  def show

  end
end
