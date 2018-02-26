class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_reviewable, only: [:new, :create, :index]
  respond_to :html
  before_filter :authenticate_user!

  def index
    if params[:review_type].present?
      @reviews = Review.where(user: current_user).where(review_type: params[:review_type].singularize).order(rating: :desc)
      @review_type = params[:review_type]
    else
      @reviews = Review.where(user: current_user).order(rating: :desc)
    end
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def lookup
    @review_type = params[:review_type]
    @options = case @review_type
               when "Restaurant"
                 Restaurant.active
               when "Item"
                 Item.active
               when "Food"
                 Food.active
               when "Ingredient"
                 Ingredient.all
               when "Tag"
                 Tag.all
               else
                 []
               end
    @review = Review.new
    render partial: 'reviews/new_form', locals: { review: @review, reviewable: @reviewable, review_type: @review_type, options: @options }
  end

  def new
    session[:return_to] ||= request.referer
    @review_type = params[:review_type]

    @options = case @review_type
               when "Restaurant"
                 Restaurant.active.order(:name)
               when "Item"
                 Item.active.order(:name)
               when "Food"
                 Food.active.order(:name)
               when "Ingredient"
                 Ingredient.all.order(:name)
               when "Tag"
                 Tag.all.order(:name)
               else
                 []
               end
    @review = Review.new
    @review.review_type = params[:review_type]
    @review.review_id   = params[:review_id]
  end

  def create_user_rating
    user_review = Review.find_or_create_by(review_id: params[:review_id], review_type: params[:review_type], user_id: current_user.id)
    user_review.update(rating: params[:rating].to_i)
    find_reviewable
    render partial: "modules/rating_reviews", locals: { reviewable: @reviewable}
  end

  def edit
    session[:return_to] = request.referer
  end

  def create
    @review = Review.find_or_initialize_by(user_id: review_params[:user_id], review_id: review_params[:review_id])
    @review.update(review_params)
    redirect_to session.delete(:return_to), notice: "Review updated"
  end

  def update
    @review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
  def set_review
    @review = Review.find(params[:id])
    @reviewable = find_reviewable
  end

  def review_params
    params.require(:review).permit(:review_id, :review_type, :user_id, :rating, :title, :description)
  end

  def find_reviewable
    if params.include?(:review_type) && params.include?(:review_id)
      @reviewable = params[:review_type].classify.constantize.find(params[:review_id])
    else
      params.each do |name, value|
        if name =~ /(.+)_id$/
          puts "name=#{name}, value=#{value}"
          @reviewable = $1.classify.constantize.find(value)
        end
      end
    end
    if !@reviewable && @review
      @reviewable = @review.review_type.classify.constantize.find(@review.review_id)
    end
    @reviewable
  end
end
