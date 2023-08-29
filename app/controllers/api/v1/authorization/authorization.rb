module Api
  module V1
    module Authorization
      class Authorization < Grape::API
        namespace :authorization do
          desc 'Register a user'
          params do
            requires :email, type: String, desc: 'Type email address'
            requires :password, type: String, desc: 'Type password'
            requires :password_confirmation, type: String, desc: 'Type password confirmation'
          end
          post :register do
            user = User.new(user_params)
            if user.save
              status 200
              user
            else
              response_error('401 Unauthorized', 401)
            end
          end

          desc "Get a current user"
          get 'detail' do
            current_user || response_error('401 Unauthorized', 401)
          end

          desc 'Login with email and password'
          params do
            requires :email, type: String, desc: 'Type email address'
            requires :password, type: String, desc: 'Type password'
          end
          post :login do
            user = User.find_by(email: params[:email])
            if user.authenticate(params[:password])
              jwt = Auth.encode({user_id: user.id})
              status 200
              { jwt: jwt }
            else
              response_error('401 Unauthorized', 401)
            end
          end
        end

        helpers do
          def user_params
            parameters.permit(:email, :password, :password_confirmation)
          end
        end
      end
    end
  end
end
