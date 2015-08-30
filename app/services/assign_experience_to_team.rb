class AssignExperienceToTeam
  attr_reader :experience, :team

  def initialize(experience, team)
    @experience = experience
    @team = team
  end

  def call
    characters = team.characters
    return false if characters.empty?
    character_experience = experience / characters.count
    characters.each do |character|
      character.experience += character_experience
      character.save
    end
  end
end
