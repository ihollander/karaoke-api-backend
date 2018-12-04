class Api::V1::UsersController < ApplicationController
  before_action :find_room

  def index
    @users = @room.users
    render json: @users
  end

  def create
    @user = @room.users.create(user_params)
    if @user.valid?
      render json: @user, status: 201
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
  
  def find_room
    @room = Room.find(params[:room_id])
  end

end
