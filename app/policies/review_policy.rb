class ReviewPolicy < ApplicationPolicy
  attr_reader :current_user, :review

  def initialize(current_user, review)
    @current_user = current_user
    @review = review
  end

  def create?
    current_user.type == "Reviewer"
  end

  def index?
    current_user.type == "Reviewer" || current_user.type == "Writer"
  end

  # def show?
  #   current_user.admin? || current_user.documents.exists?(id: document.id)
  # end

  def update?
    current_user.type == "Reviewer"
  end

  def destroy?
    current_user.type == "Reviewer"
  end
end