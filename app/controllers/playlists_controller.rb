class PlaylistsController < ApplicationController
 def index
 end

 def new
   @playlist = Playlist.new
 end

 def create
   @playlist = Playlist.new(playlist_params)
   @playlist.save ? (redirect_to @playlist) : (render :new)
 end

 def show
   @playlist = Playlist.find(params[:id])

 end

 def edit
   @playlist = Playlist.find(params[:id])
 end

 def update
   @playlist = Playlist.find(params[:id])
   if @playlist.update_attributes(playlist_params)
     redirect_to @playlist
   else
     render :edit
   end
 end

private

 def playlist_params
   params.require(:playlist).permit(:name, song_ids: [])
 end


end
