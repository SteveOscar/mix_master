class ArtistsController < ApplicationController
  before_action :artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save ? (redirect_to @artist) : (render :new)
  end

  def edit
  end

  def update
    result = @artist.update_attributes(artist_params)
    result ? (redirect_to artist_path(@artist)) : (render :edit)
  end

  def show
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

private

  def artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end


end
