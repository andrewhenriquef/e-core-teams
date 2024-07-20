class TeamsController < ApplicationController
  def index
    @teams = Team.all

    render json: @teams, include: :users
  end

  def show
    @team = Team.find(params[:id])

    render json: @team, include: :users
  end

  def create
  end

  def update
  end

  def destroy
  end
end
