module Api
  module V1
    module AccessControlApi
      class ProductAccessList < Grape::API
        namespace :access_control do
          desc 'Get list of products accessible by the client'
          get 'products' do
            client = current_user
            accessible_products = client.products.where(availability: true)
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end