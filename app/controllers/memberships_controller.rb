class MembershipsController < ApplicationController
  def create
    membership = Membership.new(
      team_id: allowed_params[:team_id],
      user_id: allowed_params[:user_id],
      role_id: allowed_params[:role_id]
    )

    if membership.save
      data = MembershipsPresenter.new(membership).serialize

      render json: data, status: :created
    else
      render json: membership.errors, status: :unprocessable_entity
    end
  end

  private

  def allowed_params
    params
      .require(:membership)
      .permit(:team_id, :user_id, :role_id)
  end
end
