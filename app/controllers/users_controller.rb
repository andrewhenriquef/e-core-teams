class UsersController < ApplicationController
  def index
    users = User.includes(:roles).all

    data = UsersPresenter.new(users).serialize

    render json: data
  end

  def show
    user = User.includes(:roles).find(params[:id])

    data = UsersPresenter.new(user).serialize

    render json: data
  end

  def create
  end

  def update
  end

  def destroy
  end
end
