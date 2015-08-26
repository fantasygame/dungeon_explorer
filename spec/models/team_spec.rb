require 'rails_helper'

RSpec.describe Team, type: :model do
  subject(:team) { build(:team) }

  describe '#level' do
    context 'team has no characters' do
      it 'returns 1' do
        expect(team.level).to eq 1
      end
    end

    context 'team has one character' do
      let(:character) { build(:character, experience: 1000) }
      it 'returns character level' do
        team.characters << character
        expect(team.level).to eq character.level
      end
    end

    context 'team has several characters' do
      context 'their average level rounds down' do
        let(:character1) { build(:character, experience: 0) }
        let(:character2) { build(:character, experience: 0) }
        let(:character3) { build(:character, experience: 1000) }
        it 'returns round down level' do
          team.characters = [character1, character2, character3]
          expect(team.level).to eq 1
        end
      end

      context 'their average level rounds up' do
        let(:character1) { build(:character, experience: 0) }
        let(:character2) { build(:character, experience: 1000) }
        let(:character3) { build(:character, experience: 1000) }
        it 'returns round up level' do
          team.characters = [character1, character2, character3]
          expect(team.level).to eq 2
        end
      end
    end
  end
end
