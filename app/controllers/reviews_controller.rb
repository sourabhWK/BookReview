include ReviewsHelper

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  include Pundit::Authorization
  before_action :load_review, only: [:edit, :update, :destroy]

  def index
    # @book = Book.where(writer_id: current_user.id )
    @book = Book.all
    @review = Review.all
    authorize @review
  end

  def new
    # @para = Book.find_by(id: params[:format])
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
    # puts "book id is ==== #{params}"
    @review = Review.new(review_params)
    authorize @review
    
    if @review.save
      redirect_to reviews_url, notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @review

    if @review.update(book_params)
      redirect_to reviews_url, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @review

    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  # private

  def review_params
    params.require(:review).permit( :description, :book_id, :reviewer_id )
  end

  def load_review
    @review = Review.find(params[:id])
  end
end
