class BandsController < ApplicationController
  before_action :set_band, only: [:show, :update, :destroy]

  def index
    render json: Band.all, status: :ok
  end

  def show
    render json: @band, status: :ok
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      render json: @band, status: :created
    else
      render json: { errors: @band.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @band.update(band_params)
      render json: @band, status: :ok
    else
      render json: { errors: @band.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @band.destroy
    render json: { success: true}, status: :ok
  end

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
