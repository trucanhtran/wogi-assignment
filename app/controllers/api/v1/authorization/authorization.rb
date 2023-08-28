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
            user = User.new(email: params[:email])
            user.password = params[:password]
            if user.save
              status 200
              user
            else
              status 400
              { error: 'Invalid email address or password' }
            end
          end

          desc 'Login with email and password'
          params do
            requires :email, type: String, desc: 'Type email address'
            requires :password, type: String, desc: 'Type password'
          end
          post :login do
            user = User.find_by(email: params[:email])
            if user.authenticate(params[:password])
              jwt = Auth.encode({user: user.id})
              status 200
              { jwt: jwt }
            else
              status 401
              { error: 'Invalid email or password' }
            end
          end
        end
      end
    end
  end
end
