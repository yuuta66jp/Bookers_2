class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def index
      @users = User.all
      @book = new
      @user2 = current_user
  end

  def about
  end

  def show
      @user = User.find(params[:id])
      @book = Book.new
      @user2 = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
