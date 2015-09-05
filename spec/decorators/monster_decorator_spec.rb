require 'rails_helper'

RSpec.describe MonsterDecorator, type: :decorator do
  let(:monster) { FactoryGirl.build(:monster, name: 'Blue Dragon').decorate }

  describe 'Monster has simple name' do
    it 'returns plural monster name if quantity is higher than 1' do
      expect(monster.name_pluralize(2)).to eq('Blue Dragons')
    end
    it 'returns single monster name if quantity is 1' do
      expect(monster.name_pluralize(1)).to eq('Blue Dragon')
    end
  end

  describe 'Monster has complex name' do
    let(:monster) { FactoryGirl.build(:monster, name: 'Blue Dragon, adult').decorate }
    it 'returns plural monster name if quantity is higher than 1' do
      expect(monster.name_pluralize(2)).to eq('Blue Dragons, adult')
    end
    it 'returns single monster name if quantity is 1' do
      expect(monster.name_pluralize(1)).to eq('Blue Dragon, adult')
    end
  end
end
