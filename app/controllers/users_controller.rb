class UsersController < ApplicationController
  def login
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
          user_reqs = Request.filter(user)
          session[:user_id] = user.id
          render json: { 
              logged_in: true,
              user: user.as_json(only: [:id, :username, :f_name, :l_name, :admin]) }
      else user
          render json: { logged_in: false, error: "Invalid username/password combination"}
      end
  end

  def logged_in
      if @current_user
          render json: { 
              logged_in: true,
              user: @current_user
          }
      else
          render json: { logged_in: false }
      end
  end

  def logout
      session.clear
      render json: { logged_in: false }
  end
end
