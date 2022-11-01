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
      # TODO write a test that checks that a band cannot be
      # created with a name that already exists
    end
  end
end
