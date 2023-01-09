class HomeController < ApplicationController
  def index
    @book = Book.all

    if user_signed_in?
      if current_user.type.eql? "Writer"
        redirect_to books_path
      else
        redirect_to reviews_path
      end
    end
  end
end
