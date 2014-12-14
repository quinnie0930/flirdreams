class UsersController < ApplicationController
  def create
    if user = User.create(username: params[:username])
      render json: { userid: user.id, username: user.username }
    else
      render json: {}, status: :unprocessable_entity
    end
  end
end
