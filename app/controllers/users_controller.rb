class UsersController < ApplicationController
    before_action :set_user, only: [:login, :update]

  def login
      if params[:password] == ENV['PASS'] && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        render json: { 
            first_login: true,
            user: @user.as_json(only: [:id, :username, :admin, :first_name, :last_name)
        }
      elsif @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          render json: { 
              logged_in: true,
              user: @user.as_json(only: [:id, :username, :admin, :first_name, :last_name]) 
          }
      else
          render json: { logged_in: false, error: "Invalid username/password combination"}
      end
  end

  def update
    @user.update_attribute(:password, params[:password])
    render json: { 
      logged_in: true,
      user: @user.as_json(only: [:id, :username, :admin, :first_name, :last_name]) 
    }
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

  private

  def set_user
    @user = User.find_by(username: params[:username].upcase)
  end
end

