class DrawController < ApplicationController
  expose(:treasure) { TreasureDraw.new(params[:level].to_i).call }
  expose(:monster_draw) { MonsterDraw.new(params[:level].to_i).call }

  def draw_monster
  end

  def draw_treasure
  end
end
