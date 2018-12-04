class Api::V1::SongsController < ApplicationController
  before_action :find_room, only: :index

  def index
    @songs = @room.songs
    render json: @songs
  end

  def create
    @song = Song.find_or_create_by(song_params)
    if @song.valid?
      render json: @song, status: 201
    else
      render json: { errors: @song.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(:youtube_id, :title)
  end
  
  def find_room
    @room = Room.find(params[:room_id])
  end
end
