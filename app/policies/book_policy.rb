class BookPolicy < ApplicationPolicy
  attr_reader :current_user, :book

  def initialize(current_user, book)
    @current_user = current_user
    @book = book
  end

  def create?
    current_user..type == "Writer"
  end

  def index?
    current_user.type == "Reviewer" || current_user.type == "Writer"
  end

  # def show?
  #   current_user.admin? || current_user.documents.exists?(id: document.id)
  # end

  def update?
    current_user.type == "Writer"
  end

  def destroy?
    current_user.type == "Writer"
  end
end