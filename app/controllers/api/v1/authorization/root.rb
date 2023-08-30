module Api
  module V1::Authorization
    class Root < Grape::API
      extend ActiveSupport::Concern

      helpers do
        def user_params
          parameters.permit(:email, :password, :password_confirmation)
        end
      end

      mount Api::V1::Authorization::Register
      mount Api::V1::Authorization::Login
      mount Api::V1::Authorization::Detail
    end
  end
end
