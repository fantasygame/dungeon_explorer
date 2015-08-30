class AssignTreasureToTeam
  attr_reader :treasure, :team

  def initialize(treasure, team)
    @treasure = treasure
    @team = team
  end

  def call
    treasure.items.each do |item|
      team.items << item
    end
    team.money += treasure.money
    team.save
  end
end
