module ReviewsHelper
  def is_reviewed
    # puts " ====================== is called ================================="
    # puts "user id: #{current_user.id}, book id: #{params[:format]}"
    if (Review.where(book_id: params[:format], reviewer_id: current_user.id)).count > 0
      return true
    else
      return false
    end
  end

  def is_reviewer(writer_id)
    current_user.id == writer_id
  end

  def show_book(id)
    Book.find_by(id: id)
  end

  def show_reviewer_name(review_id)
    review = Review.find_by(id: review_id)
    reviewer = Reviewer.find_by(id: review.reviewer_id)
    if reviewer.id.eql? current_user.id
    return "You"
    else
      return reviewer.name
    end
  end

  def show_book_writer(writer_id)
    return (Writer.find_by(id: writer_id)).name
  end
end
