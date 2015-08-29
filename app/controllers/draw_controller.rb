class DrawController < ApplicationController
  expose(:treasure) { TreasureDraw.new(level).call }
  expose(:monster_draw) { MonsterDraw.new(level).call }
  expose(:level) { params[:level].to_i }

  def draw_monster
  end

  def draw_treasure
  end
end
