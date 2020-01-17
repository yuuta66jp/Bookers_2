class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.user_id
      @book.save
      redirect_to books_path
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end

end
