require 'rails_helper'

RSpec.describe MonsterDraw, type: :class do
  let(:monster) { FactoryGirl.create(:monster, challenge_rating: 4) }
  subject(:service) { described_class.new(level = 10) }

  before { service.call }

  describe 'draw monster level considering team level' do
    context 'team level is grater than 6' do
      it 'sets random monster level from range 5 - 11' do
        expect(service.draw_monster_level).to be_between(5, 11).inclusive
      end
    end
    context 'team level is 1' do
      let(:service) { described_class.new(level = 1) }
      it 'sets monster level to 1 when random level is lower than 1' do
        expect(service.draw_monster_level).to be_between(1, 2).inclusive
      end
    end
  end

  describe 'draw monster quantity considering monster level' do
    it 'returns 1 when monster level is lower by 1 than team level' do
      allow(service).to receive(:draw_monster_level) { 9 }
      expect(service.draw_monster_quantity(service.draw_monster_level)).to eq(1)
    end
    it 'returns 1 when monster level is greater by 1 than team level' do
      allow(service).to receive(:draw_monster_level) { 11 }
      expect(service.draw_monster_quantity(service.draw_monster_level)).to eq(1)
    end
    it 'returns 1 when monster level is equal team level' do
      allow(service).to receive(:draw_monster_level) { 10 }
      expect(service.draw_monster_quantity(service.draw_monster_level)).to eq(1)
    end
    it 'returns quantity greater than 1 when monsters have lower level' do
      allow(service).to receive(:draw_monster_level) { 7 }
      expect(service.draw_monster_quantity(service.draw_monster_level)).to eq(3)
    end
  end

  describe 'draw monster with quantity adequate to team challenge rating' do
    it 'returns monster with challenge rating 4 in quantity 6' do
      allow(service).to receive(:draw_monster_level) { 4 }
      expect(described_class).to eq [monster, 6]
    end
  end
end
