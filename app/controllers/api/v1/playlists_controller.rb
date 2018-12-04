class Api::V1::PlaylistsController < ApplicationController
  before_action :find_room

  def index
    @playlists = @room.playlists
    render json: @playlists
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.valid?
      render json: @playlist, status: 201
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:user_id, :song_id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end
  
end
