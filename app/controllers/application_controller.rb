class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def get_awake_time(awake_time, user_id)
    awake_time = new Awake(awake_time)
    awake_time.user_id=user_id
    awake_time.save!
  end
end
