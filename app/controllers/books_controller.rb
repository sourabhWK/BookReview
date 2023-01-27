class BooksController < ApplicationController
  before_action :authenticate_user!
  # before_action :verify_writer
  include Pundit::Authorization
  before_action :load_book, only: [:edit, :update, :destroy]


  def index
    @book = Book.where(writer_id: current_user.id )
    authorize @book

  end

  def new
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def create
    writer = Writer.find_by(id: current_user.id)
    @book = writer.books.create(book_params)
    authorize @book

    if @book
      redirect_to books_url, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @book

    if @book.update(book_params)
      redirect_to books_url, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
    
  def destroy
    authorize @book

    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end

  def load_book
    @book = Book.find(params[:id])
  end

  # def verify_writer
  #   unless current_user.type.eql? "Writer"
  #     # flash[:notice] = "You are not authorized to edit this user."
  #     flash[:notice] = "You are Reviewer not authorized to edit this user(Writer)."
  #     redirect_to reviews_path
  #   end
  # end
end
