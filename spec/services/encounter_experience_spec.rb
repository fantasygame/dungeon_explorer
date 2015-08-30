require 'rails_helper'

RSpec.describe EncounterExperience, type: :class do

  context 'team level below 3' do
    it 'returns exp for 3 level' do
      expect(described_class.new(1, 5).call).to eq 1800
      expect(described_class.new(1, 1).call).to eq 300
    end
  end

  context 'challenge rating equal team level' do
    it 'returns team level * 300' do
      expect(described_class.new(5, 5).call).to eq 5 * 300
    end
  end

  context 'team level lower than team level' do
    context 'by 1' do
      it 'returns team level * 200' do
        expect(described_class.new(10, 9).call).to eq 10 * 200
      end
    end

    context 'by 2' do
      it 'returns base exp / 2' do
        expect(described_class.new(10, 8).call).to eq 10 * 300 / 2
      end
    end

    context 'by 3' do
      it 'returns base exp / 3' do
        expect(described_class.new(10, 7).call).to eq 10 * 300 / 3
      end
    end

    context 'by 4' do
      it 'returns base exp / 4' do
        expect(described_class.new(10, 6).call).to eq 10 * 300 / 4
      end
    end

    context 'by 5' do
      it 'returns base exp / 6' do
        expect(described_class.new(10, 5).call).to eq 10 * 300 / 6
      end
    end

    context 'by 6' do
      it 'returns base exp / 8' do
        expect(described_class.new(10, 4).call).to eq 10 * 300 / 8
      end
    end

    context 'by 7' do
      it 'returns base exp / 12' do
        expect(described_class.new(10, 3).call).to eq 10 * 300 / 12
      end
    end

    context 'by more than 7' do
      it 'returns 0' do
        expect(described_class.new(10, 2).call).to eq 0
      end
    end
  end

  context 'team level higher than team level' do
    context 'by 1' do
      it 'returns team level * 400' do
        expect(described_class.new(10, 11).call).to eq 10 * 400
      end
    end

    context 'by more than 1 less than 8' do
      it 'returns calculated results' do
        expect(described_class.new(10, 15).call).to eq 18000
        expect(described_class.new(8, 10).call).to eq 4800
        expect(described_class.new(16, 20).call).to eq 19200
        expect(described_class.new(7, 14).call).to eq 25200
      end
    end

    context 'by more than 7' do
      it 'returns 0' do
        expect(described_class.new(10, 18).call).to eq 0
        expect(described_class.new(3, 13).call).to eq 0
      end
    end
  end

  context 'challenge rating 1' do
    it "doesn't return higher result than 300" do
      expect(described_class.new(1, 1).call).to eq 300
      expect(described_class.new(2, 1).call).to eq 300
      expect(described_class.new(3, 1).call).to eq 300
    end
  end
end
