class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
  end

  def index
      @users = User.all
      @book = Book.new
      @user = User.find(current_user.id)
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :profile_image, :introduction)
  end

end
