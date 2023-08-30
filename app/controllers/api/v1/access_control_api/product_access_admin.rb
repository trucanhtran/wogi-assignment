module Api
  module V1
    module AccessControlApi
      class ProductAccessAdmin < Grape::API
        namespace :access_control do
          desc 'Get list of products that a client has access to'
          params do
            requires :user_id, type: Integer, desc: 'ID of the customer'
          end
          get 'products/:user_id' do
            client = User.find(params[:user_id])
            accessible_products = client.products.where(availability: true)
            status 200
            accessible_products
          rescue ActiveRecord::RecordNotFound
            response_error('Client not found', 404)
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end