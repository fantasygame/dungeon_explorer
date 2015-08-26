class CharactersController < ApplicationController
  expose(:character, attributes: :character_params)
  expose(:characters)
  expose(:team)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if character.save
      redirect_to(team_characters_path(team))
    else
      render :new
    end
  end

  def update
    if character.save
      redirect_to(team_character_path(team, character))
    else
      render :edit
    end
  end

  def destroy
    character.destroy && redirect_to(team_characters_path(team))
  end

  private

  def character_params
    params.require(:character).permit(:name, :experience, :team_id)
  end
end
