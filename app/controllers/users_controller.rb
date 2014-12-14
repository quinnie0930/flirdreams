class UsersController < ApplicationController
  def create
    if user = User.create(username: params[:username])
      render json: { userid: user.id, username: user.username }
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def sleep_cycle
    if user = User.find_by(id: params[:id])
      render json: { username: user.username, sleep_cycle: user.get_sleep_cycle }
    else
      render json: {}, status: :unprocessable_entity
    end
  end
end
