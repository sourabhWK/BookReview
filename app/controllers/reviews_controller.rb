include ReviewsHelper

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_reviewer
  before_action :load_book, only: [:edit, :update, :destroy]

  def index
    # @book = Book.where(writer_id: current_user.id )
    @book = Book.all
    @review = Review.all
  end

  def new
    @para = Book.find_by(id: params[:format])
    if is_reviewed
      redirect_to reviews_url, notice: 'You have already reviewed this book.'
    else
      @review = Review.new
    end
  end

  def show
    @reviews = Review.where(book_id: params[:id])
    @book = show_book(params[:id])
  end

  def edit

  end

  def create
    reviewer = Reviewer.find_by(id: current_user.id)
    @review = reviewer.reviews.create(review_params)
    if @review
      redirect_to reviews_url, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(book_params)
      redirect_to reviews_url, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  # private

  def review_params
    params.require(:review).permit(:description, :book_id)
  end

  def verify_reviewer
    unless current_user.type.eql? "Reviewer"
      # flash[:notice] = "You are not authorized to edit this user."
      flash[:notice] = "You are Writer not authorized to edit this user(Reviewer)."
      
    end
  end

  def load_book
    @review = Review.find(params[:id])
  end
end
