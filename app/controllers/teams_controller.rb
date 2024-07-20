class TeamsController < ApplicationController
  before_action :team, only: %i[show update destroy]
  def index
    @teams = Team.include(:users).all

    render json: @teams, include: :users
  end

  def show
    render json: @team, include: :users
  end

  def create
    @team = Team.new(allowed_params)

    return render json: @team, status: :created if @team.save

    render json: @team.errors, status: :unprocessable_entity
  end

  def update
    return render json: @team if @team.update(allowed_params)

    render json: @team.errors, status: :unprocessable_entity
  end

  def destroy
    @team.destroy

    head :no_content
  end

  private

  def team
    @team ||= Team.find(params[:id])
  end

  def allowed_params
    params
      .require(:team)
      .permit(:name, :description)
  end
end
