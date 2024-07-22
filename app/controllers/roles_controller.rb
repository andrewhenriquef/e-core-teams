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
    role = Role.new(allowed_params)

    if role.save
      data = RolesPresenter.new(role).serialize

      render json: data, status: :created
    else
      render json: role.errors, status: :unprocessable_entity
    end
  end

  def allowed_params
    params
      .require(:role)
      .permit(:name, :description)
  end
end
