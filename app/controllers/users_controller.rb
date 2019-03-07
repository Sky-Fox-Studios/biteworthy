class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_user
    @tag_reviews = Review.tag_reviews(current_user).order_desc
    @item_reviews = Review.item_reviews(current_user).order_desc
    @restaurant_reviews = Review.restaurant_reviews(current_user).order_desc
  end

  def show
    liked_foods    = @item_reviews.where('rating > 0').map{|item| item.review.foods}.flatten.uniq
    meh_foods      = @item_reviews.where('rating = 0').map{|item| item.review.foods}.flatten.uniq
    disliked_foods = @item_reviews.where('rating < 0').map{|item| item.review.foods}.flatten.uniq

    @huh_foods      = (liked_foods & meh_foods & disliked_foods).sort_by(&:name)
    @meh_foods      = (liked_foods & disliked_foods).sort_by(&:name)
    @liked_foods    = (liked_foods - disliked_foods).sort_by(&:name)
    @disliked_foods = (disliked_foods - liked_foods).sort_by(&:name)
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
