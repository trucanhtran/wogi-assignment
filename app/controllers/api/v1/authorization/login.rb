module Api
  module V1
    module Authorization
      class Login < Grape::API
        namespace :authorization do
          desc 'Login with email and password'
          params do
            requires :email, type: String, desc: 'Type email address'
            requires :password, type: String, desc: 'Type password'
          end
          post :login do
            user = User.find_by(email: params[:email])
            if user.authenticate(params[:password])
              jwt = Auth.encode({user_id: user.id})
              { jwt: jwt }
            else
              response_error('401 Unauthorized', 401)
            end
          end
        end
      end
    end
  end
end
