class Api::V1::SongsController < ApplicationController

  def index
    room = Room.find(params[:room_id])
    @songs = room.songs
    render json: @songs
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      # add to playlist after created
      @playlist = Playlist.create(user_id: params[:user_id], song_id: @song.id)
      render json: @song, status: 201
    else
      render json: { errors: @song.errors.full_messages }, status: :bad_request
    end
  end

  private

  def song_params
    params.require(:song).permit(:youtube_id, :title)
  end
  
end
