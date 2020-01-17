class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def index
      @users = User.all
      @book = new
  end

  def about
  end

  def show
  end

  def edit
  end

  def update
  end
end
