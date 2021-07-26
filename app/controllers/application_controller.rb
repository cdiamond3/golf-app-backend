class ApplicationController < ActionController::API

  before_action :authenticate

  def authenticate
    auth_header = request.headers[:authorization]

    if !auth_header
      render json: { error: "You must be logged in. Send Bearer Token" }, status: :forbidden
    else
      token = auth_header.split(" ")[1]
      secret = "jkodahsdjkasjkldjaslkdjsalkjdksajdklasjdlksadsad"

      begin
        decoded_token = JWT.decode token, secret

        payload = decoded_token.first
        user_id = payload["user_id"]

        @user = User.find user_id
      rescue
        render json: { error: "Invalid Token" }, status: :forbidden
      end
    end
  end
end
