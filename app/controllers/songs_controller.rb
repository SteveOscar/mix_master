 class SongsController < ApplicationController
  def index
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
    @artist = @song.artist
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)
    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(@song[:artist_id])
  end

  # def destroy
  #
  # end

private

  def song_params
    params.require(:song).permit(:title)
  end


end
