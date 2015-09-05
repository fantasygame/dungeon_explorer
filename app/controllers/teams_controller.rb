class TeamsController < ApplicationController
  expose(:team, attributes: :team_params)
  expose(:teams) { current_user.teams }
  expose(:treasure) { TreasureDraw.new(level).call }
  expose(:experience) { EncounterExperience.new(team.level, level).call }
  expose(:monster_draw) { MonsterDraw.new(draw_monster_level).call }
  expose(:level) { params[:level].to_i }
  expose(:draw_monster_level) { params[:draw_monster][:level].to_i }

  def draw_monster
  end

  def draw_treasure
    AssignTreasureToTeam.new(treasure, team).call
    AssignExperienceToTeam.new(experience, team).call
  end

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
