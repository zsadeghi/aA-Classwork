class ArtworkController < ApplicationController
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save 
      render json:artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params.require(:id))
    if artwork.destroy
      render json:artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: Artwork.all
  end

  def show
    render json: Artwork.find(params.require(:id))
  end

  def update
    artwork = Artwork.find(params.require(:id))
    if artwork.update(artwork_params)
      render json:artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def artwork_params
    params.require(:artwork).permit(:artist_id, :artwork_id, :title)
  end
end
