class RolesController < ApplicationController
  def index
    roles = Role.all

    data = RolesPresenter.new(roles).serialize

    render json: data
  end

  def show
    role = Role.find(params[:id])

    data = RolesPresenter.new(role).serialize

    render json: data
  end

  def create
  end

  def update
  end

  def destroy
  end
end
