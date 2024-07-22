class TeamsController < ApplicationController
  def index
    teams = Team.all

    data = TeamsPresenter.new(teams).serialize

    render json: data
  end

  def show
    team = Team.includes(:team_lead, :users, users: :roles).find(params[:id])

    data = TeamPresenter.new(team).serialize

    render json: data
  end

  def create
    team = Team.new(allowed_params)

    return render json: team, status: :created if team.save

    render json: team.errors, status: :unprocessable_entity
  end

  private

  def allowed_params
    params
      .require(:team)
      .permit(:name, :description)
  end
end
