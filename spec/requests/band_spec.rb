require "rails_helper"

RSpec.describe Band, type: :request do
  let!(:band) { Band.create(name: 'The Beatles', genre: 'Rock') }

  describe '#index' do
    it "returns all the bands" do
      get "/bands"
      bands = JSON.parse(response.body)
      expect(bands.size).to be >= 1
      expect(bands[0]["name"]).to eq "The Beatles"
    end
  end

  describe '#show' do
    it "shows a band correctly with :ok response code" do
      get "/bands/#{band.slug}"
      expect(response).to have_http_status(:ok)
      band_response = JSON.parse(response.body)
      expect(band_response['name']).to eq "The Beatles"
    end
  end

  describe '#create' do
    let(:band_params) do
      { band: { name: 'The Rolling Stones', genre: 'Rock' } }
    end

    it "creates a band" do
      expect {
        post "/bands", params: band_params
      }.to change { Band.count }.by(1)
    end

    it "has :created response code" do
      post "/bands", params: band_params
      expect(response).to have_http_status(:created)
    end

    it 'responds with band data' do
      post "/bands", params: band_params
      band_response = JSON.parse(response.body)
      expect(band_response['name']).to eq "The Rolling Stones"
    end
  end

  describe '#update' do
    let(:new_genre) { 'Psychedelic Rock' }

    it "updates a band" do
      # TODO Complete this test which updates the band's genre to 'Psychedelic Rock'
      # Make sure the response is :ok,
      # and then make sure the band's genre has been updated in the database!
      post "/bands/#{band.slug}", params: { band: { genre: new_genre } }
    end
  end

  # TODO Add a test for the #destroy action
end
