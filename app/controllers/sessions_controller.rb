class SessionsController < ApplicationController
  def create
    # user_id = User.find_by(uid: request.env['omniauth.auth']["uid"])
    if User.find_by(uid: request.env['omniauth.auth']["uid"]).nil?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to edit_user_path(user)
    else
      session[:user_id] = User.find_by(uid: request.env['omniauth.auth']["uid"])
      redirect_to users_path
    end

  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
