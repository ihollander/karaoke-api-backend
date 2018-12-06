class Api::V1::UsersController < ApplicationController
  before_action :find_room, only: [:index, :create]
  before_action :find_user, only: :destroy

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

  def destroy 
    @user.destroy
    head :no_content 
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
  
  def find_room
    @room = Room.find(params[:room_id])
  end

  def find_user
    @user = User.find(params[:id])
  end

end
