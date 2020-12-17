class UsersController < ApplicationController
    before_action :set_user, only: [:login, :update]

  def login
      if params[:username] == "demo"
        guest_id = rand(7..17)
        guest = User.demo_accounts.find(guest_id)
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
    if @current_user.demo 
      user = User.create(
        username: params[:username],
        password: params[:password],
        first_name: params[:first_name],
        last_name: params[:last_name],
        phone: params[:phone],
        email: params[:email],
        admin: params[:admin],
        demo: true
      )
    else
      user = User.create(
        username: params[:username],
        password: params[:password],
        first_name: params[:first_name],
        last_name: params[:last_name],
        phone: params[:phone],
        email: params[:email],
        admin: params[:admin]
      )
    end
    if user.save
      render json: user
    else
      errors = user.errors.full_messages.map
      render json: { error: errors }
    end
  end

  def contact_list
    user = User.find(session[:user_id])
    if @current_user.demo
      contact_list = User.demo_accounts
    else
      contact_list = User.all
    end
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

  def destroy
    User.find(params[:id]).destroy
    render json: { status: 200 }
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

