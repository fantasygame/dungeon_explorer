class TeamsController < ApplicationController
  expose(:team, attributes: :team_params)
  expose(:teams) { current_user.teams }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    team.members << current_user
    if team.save
      redirect_to(teams_path)
    else
      render :new
    end
  end

  def update
    if team.save
      redirect_to(teams_path)
    else
      render :edit
    end
  end

  def destroy
    team.destroy && redirect_to(teams_path)
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
