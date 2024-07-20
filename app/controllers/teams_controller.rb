class TeamsController < ApplicationController
  def index
    @teams = Team.all

    render json: @teams, include: :users
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
