module Api
  module V1
    class AuthenticationController < ApplicationController
      # Login işleminde token kontrolü yapılmaz
      skip_before_action :authorize_request, only: :login

      # POST /api/v1/auth/login
      def login
        @user = User.find_by(email: params[:email])
        
        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          render json: { token: token, user: { id: @user.id, name: @user.name, email: @user.email } }, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end