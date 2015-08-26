require 'rails_helper'

RSpec.describe Character, type: :model do
  subject(:character) { build(:character) }

  describe '#level' do
    context 'character has 0 experience' do
      it 'returns 1st level' do
        character.experience = 0
        expect(character.level).to eq 1
      end
    end

    context 'character has exp between 1st and 2nd level' do
      it 'returns 1st level' do
        character.experience = 500
        expect(character.level).to eq 1
      end
    end


    context 'character has exp equal to second level cap' do
      it 'returns 2st level' do
        character.experience = 1000
        expect(character.level).to eq 2
      end
    end

    context 'character has exp exceeding 20th level' do
      it 'returns 20th level' do
        character.experience = 999999999
        expect(character.level).to eq 20
      end
    end
  end
end
