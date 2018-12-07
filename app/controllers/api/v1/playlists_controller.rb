class Api::V1::PlaylistsController < ApplicationController
  before_action :find_room, only: [:index, :create]
  before_action :find_playlist, only: [:update, :destroy]

  def index
    @playlists = @room.playlists
    render json: @playlists
  end

  def create
    sort = @room.playlists.maximum(:sort) || 0
    my_params = playlist_params.merge(sort: sort + 1)
    @playlist = Playlist.create(my_params)
    if @playlist.valid?
      render json: @playlist, status: 201
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if params[:sort]
      @playlist.update(sort: params[:sort])
    elsif params[:played]
      @playlist.update(played: params[:played])
    end
    if @playlist.valid?
      render json: @playlist, status: :ok
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist.destroy
    head :no_content 
  end

  private

  def playlist_params
    params.require(:playlist).permit(:user_id, :song_id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
  
end
