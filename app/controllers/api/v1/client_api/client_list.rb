module Api
  module V1
    module ClientApi
      class ClientList < Grape::API
        namespace :client do
          desc 'Client List'
          get do
            clients = User.where(user_type: 'client')
            status 200
            clients.select(:id, :email, :payout_rate, :user_type)
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end