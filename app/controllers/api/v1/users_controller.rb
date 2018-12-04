class Api::V1::UsersController < ApplicationController

  def index
    room = Room.find(params[:room_id])
    @users = room.users
    render json: @users
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: 201
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:room_id, :name)
  end
  
end
