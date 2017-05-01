class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_reviewable, only: [:new, :create, :index]
  respond_to :html
  before_filter :authenticate_user!

  def index
     @reviews = Review.all.order(rating: :desc)
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    session[:return_to] ||= request.referer
    @review = Review.new
    respond_with(@review)
  end

  def create_user_rating
    user_review = Review.find_or_create_by(review_id: params[:review_id], review_type: params[:review_type], user_id: current_user.id)
    user_review.update(rating: params[:rating].to_i)
    find_reviewable
    render partial: "modules/rating_reviews", locals: { rating: params[:rating].to_i, reviewable: @reviewable}
  end

  def edit
    session[:return_to] = request.referer
  end

  def create
    review_params[:rating] = review_params[:rating].to_i
    @review = @reviewable.reviews.new(review_params)
    @review.save
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
       params.require(:review).permit(:review_id, :review_type, :user_id, :rating)
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
