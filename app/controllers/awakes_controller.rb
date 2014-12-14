class AwakesController < ApplicationController
  def create
    user = User.find(params[:userid])

    if user && awake = user.awakes.create(awake_time: Time.now)
      render json: { awake_id: awake.id, time: awake.created_at }
    else
      render json: {}, status: :unprocessable_entity
    end
  end
end
