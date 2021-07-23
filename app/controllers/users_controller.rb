class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:create, :login]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create username: params[:username], password: params[:password]
    render json: @user
  end

  def login
    @user = User.find_by username: params[:user][:username]
    if !@user
      render json: { error: "Wrong Username and/or Password" }, status: :unauthorized
    else
      if !@user.authenticate params[:user][:password]
        render json: { error: "Wrong Username and/or Password" }, status: :unauthorized
      else
        payload = { user_id: @user.id }
        secret = "jkodahsdjkasjkldjaslkdjsalkjdksajdklasjdlksadsad"

        token = JWT.encode payload, secret
        render json: { token: token, user: @user }, status: :ok
      end
    end
  end
end
