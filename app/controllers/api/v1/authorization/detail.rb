module Api
  module V1
    module Authorization
      class Detail < Grape::API
        namespace :authorization do
          desc "Get a current user"
          get 'detail' do
            current_user || response_error('401 Unauthorized', 401)
          end
        end
      end
    end
  end
end
