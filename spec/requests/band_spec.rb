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

    it 'includes the gigs' do
      venue = Venue.create(name: 'The Roundhouse')
      gig = Gig.create(date: '2019-01-01', band: band, venue: venue)
      get "/bands/#{band.slug}"
      band_response = JSON.parse(response.body)
      expect(band_response['gigs'].size).to eq 1
      expect(band_response['gigs'][0]['date']).to eq '2019-01-01'
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
      post "/bands/#{band.slug}", params: { band: { genre: new_genre } }
      expect(response).to have_http_status(:ok)
      band.reload
      expect(band.genre).to eq new_genre
    end
  end

  describe '#destroy' do
    it "deletes a band" do
      expect {
        delete "/bands/#{band.slug}"
      }.to change { Band.count }.by(-1)
    end
  end
end
