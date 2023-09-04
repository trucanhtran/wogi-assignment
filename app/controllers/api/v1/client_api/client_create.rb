module Api
  module V1
    module ClientApi
      class ClientCreate < Grape::API
        namespace :client do
          desc 'Add a new client'
          params do
            requires :email, type: String, desc: 'Email of the client'
            requires :payout_rate, type: Float, desc: 'Payout rate of the client'
          end
          patch 'add' do
            client_params = {
              user_type: 'client',
              payout_rate: params[:payout_rate]
            }
            user = User.find_by_email(params[:email])
            if user.present? && user.user_type != 'client'
              client = user.update(client_params)
              status 200
              client
            elsif
              response_error('Failed to add a new client', 500)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end