class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_user
    @tag_reviews = Review.tag_reviews(current_user).order_desc
    @item_reviews = Review.item_reviews(current_user).order_desc
    @restaurant_reviews = Review.restaurant_reviews(current_user).order_desc
  end

  def show
    @items_created = Item.items_created(current_user)
    @photos_taken = Photo.photos_taken(current_user)
    @foods_created = Food.foods_created(current_user)
    @tags_created = Tag.tags_created(current_user)
    @ingredients_created = Ingredient.ingredients_created(current_user)
    @reviews_created = Review.reviews_created(current_user)

    @points = 42 + # You are a user on BiteWorthy that is worth 42 points
      @items_created       * 20 +
      @photos_taken        * 15 +
      @foods_created       * 10 +
      @tags_created        * 5  +
      @ingredients_created * 2  +
      @reviews_created


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
