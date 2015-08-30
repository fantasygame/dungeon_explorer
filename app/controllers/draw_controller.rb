class DrawController < ApplicationController
  expose(:treasure) { TreasureDraw.new(level).call }
  expose(:experience) { EncounterExperience.new(team.level, level).call }
  expose(:monster_draw) { MonsterDraw.new(draw_monster_level).call }
  expose(:level) { params[:level].to_i }
  expose(:draw_monster_level) { params[:draw_monster][:level].to_i }
  expose(:team) { Team.find(params[:team_id]) }

  def draw_monster
  end

  def draw_treasure
    AssignTreasureToTeam.new(treasure, team).call
    AssignExperienceToTeam.new(experience, team).call
  end
end
