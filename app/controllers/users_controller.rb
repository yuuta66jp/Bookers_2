class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user,only:[:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    method = params[:search_method]
    word = params[:search_word]
    @users1 = User.all
    if params[:search_select] == "user_search"
    @users = User.search(method,word)
    elsif params[:search_select] =="book_search"
      @books = Book.search(method,word)
    end
    @book = Book.new
    @user = User.find(current_user.id)

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
   else
    render :edit
  end
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

def correct_user
  user = User.find(params[:id])
  if current_user != user
    redirect_to user_path(current_user.id)
  end
end

end
