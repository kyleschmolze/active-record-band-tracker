class BandsController < ApplicationController
  before_action :set_band, only: [:show, :update]

  def index
    render json: Band.all, status: :ok
  end

  def show
    render json: @band, status: :ok
  end

  def create
    @band = Band.new(band_params)
    # TODO Finish this action
  end

  def update
    # TODO Write this action:
    # Use ActiveRecord's @band.update() method
    # (and pass in the band_params)
    # what does @band.update() return?

    # If the update fails, try rendering the errors using @band.errors.full_messages
    # A binding.pry will be very helpful here to test your code first!
  end

  # TODO Add a destroy action

  protected

  def band_params
    params.require(:band).permit(:name, :genre)
  end

  def set_band
    @band = Band.find_by(slug: params[:slug])
    unless @band.present?
      render json: { error: 'Band not found' }, status: :not_found
    end
  end
end
