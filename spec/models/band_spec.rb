require 'rails_helper'

RSpec.describe Band do
  before(:each) do
    Band.create(name: 'The Beatles', genre: 'Rock')
  end

  describe 'validations' do
    it 'is invalid without a name' do
      band = Band.new(genre: 'Rock')
      expect(band).to_not be_valid
      expect(band.errors).to have_key(:name)
    end

    it 'is invalid with a pre-existing name' do
      band = Band.new(name: 'The Beatles', genre: 'Rock')
      expect(band).to_not be_valid
      expect(band.errors).to have_key(:name)
    end
  end

  describe 'the .albums method' do
    let(:band) do
      Band.new(name: 'The Beatles', genre: 'Rock')
    end

    it 'returns an array of albums' do
      expect(band.albums).to be_an(Array)
      expect(band.albums).to include 'I Saw Her Standing There'
      expect(band.albums).to include '1'
    end
  end
end
