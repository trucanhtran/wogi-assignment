module Api
  module V1
    module Authorization
      class Register < Grape::API
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
              response_error('Can not register a new user', 400)
            end
          end
        end
      end
    end
  end
end
