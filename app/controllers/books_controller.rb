class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_writer

  def index
    @book = Book.where(writer_id: current_user.id )
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    writer = Writer.find_by(id: current_user.id)
    @book = writer.books.create(book_params)
    if @book
      redirect_to books_url, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_url, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
    
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end

  def verify_writer
    unless current_user.type.eql? "Writer"
      # flash[:notice] = "You are not authorized to edit this user."
      flash[:notice] = "You are Reviewer not authorized to edit this user(Writer)."
      redirect_to reviews_path
    end
  end
end
