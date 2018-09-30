class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_user
    @tag_reviews = Review.tag_reviews(current_user).order_desc
    @item_reviews = Review.item_reviews(current_user).order_desc
    @restaurant_reviews = Review.restaurant_reviews(current_user).order_desc
  end

  def show
    @photos_taken = Photo.photos_taken(current_user)

    liked_foods    = @item_reviews.where('rating > 0').map{|item| item.review.foods}.flatten.uniq
    meh_foods      = @item_reviews.where('rating = 0').map{|item| item.review.foods}.flatten.uniq
    disliked_foods = @item_reviews.where('rating < 0').map{|item| item.review.foods}.flatten.uniq

    @huh_foods      = liked_foods & meh_foods & disliked_foods
    @meh_foods      = liked_foods & disliked_foods
    @liked_foods    = liked_foods - disliked_foods
    @disliked_foods = disliked_foods - liked_foods

  end
end
