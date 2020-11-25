class UsersController < ApplicationController
    before_action :set_user, only: [:login, :update]

  def login
      if params[:username] == "demo"
        guest = User.find_by(username: "DEM")
        if !guest
          guest = User.create(
            username: "DEM",
            password: "demo",
            first_name: "Demo",
            last_name: "Account",
            admin: true
          ) 
        end
        session[:user_id] = guest.id
        render json: {
          logged_in: true,
          user: guest
        }
      elsif params[:password] == ENV['PASS'] && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        render json: { 
            first_login: true,
            user: @user
        }
      elsif @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          render json: { 
              logged_in: true,
              user: @user
          }
      else
          render json: { 
            logged_in: false, 
            error: "Invalid username/password combination"
          }
      end
  end

  def create
    user = User.create(
      username: params[:username],
      password: params[:password],
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone: params[:phone],
      email: params[:email]
    )
    if user.save
      render json: user
    else
      errors = user.errors.full_messages.map
      render json: { error: errors }
    end
  end

  def contact_list
    contact_list = User.all
    render json: contact_list
  end

  def update
    @user.update_attribute(:password, params[:password])
    if params[:email] && params[:email] != ""
      @user.update_attribute(:email, params[:email])
    end
    if params[:phone] && params[:phone] != ""
      @user.update_attribute(:phone, params[:phone])
    end
    render json: { 
      logged_in: true,
      user: @user
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

