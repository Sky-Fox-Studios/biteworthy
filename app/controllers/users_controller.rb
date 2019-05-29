class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_user
    @tag_reviews        = Review.tag_reviews(current_user).order_desc
    @food_reviews       = Review.food_reviews(current_user).order_desc
    @item_reviews       = Review.item_reviews(current_user).order_desc
    @restaurant_reviews = Review.restaurant_reviews(current_user).order_desc
  end

  def show
    # @food_reviews
    #TODO allow eager loading of foods
    liked_foods    = @item_reviews.where('rating > 0').map{|item| item.review.foods.includes(:restaurant)}.flatten.uniq
    ok_foods       = @item_reviews.where('rating = 0').map{|item| item.review.foods.includes(:restaurant)}.flatten.uniq
    disliked_foods = @item_reviews.where('rating < 0').map{|item| item.review.foods.includes(:restaurant)}.flatten.uniq

    @ok_foods        = (liked_foods & disliked_foods).sort_by(&:name)
    @liked_foods     = (liked_foods - disliked_foods).sort_by(&:name)
    @disliked_foods  = (disliked_foods - liked_foods).sort_by(&:name)
    @undecided_foods = (liked_foods & ok_foods & disliked_foods).sort_by(&:name)
  end

  def choose_tags
    ingredient_tags = @tags.joins(:items).where(variety: 0).uniq.order(:name)
    choice_tags     = @tags.joins(:items).where(variety: 2).uniq.order(:name)
    nature_tags     = @tags.joins(:items).where(variety: 3).uniq.order(:name)
    @tags = [ingredient_tags, choice_tags, nature_tags]
    @ratings = Review.ratings
    @reviews = Review.tag_reviews(current_user.id)
  end
end
