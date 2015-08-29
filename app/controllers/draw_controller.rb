class DrawController < ApplicationController
  expose(:treasure) { TreasureDraw.new(level).call }
  expose(:monster_draw) { MonsterDraw.new(level).call }
  expose(:level) { params[:level].to_i }

  def draw_monster
  end

  def draw_treasure
    assign_treasure_to_team(treasure, Team.first)
  end

  private

  def assign_treasure_to_team(treasure, team)
    treasure.items.each do |item|
      team.items << item
    end
    team.money += treasure.money
    team.save
  end
end
