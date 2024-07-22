# frozen_string_literal: true

class RoleMembershipsController < ApplicationController
  def show
    role_with_memberships = Role.includes(:memberships)
                                .find(allowed_params[:role_id])

    data = RoleMembershipsPresenter.new(role_with_memberships).serialize

    render json: data, status: :ok
  end

  private

  def allowed_params
    params.permit(:role_id)
  end
end
