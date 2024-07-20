class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, include: :roles
  end

  def show
    @user = User.find(params[:id])

    render json: @user, include: :roles
  end

  def create
  end

  def update
  end

  def destroy
  end
end
