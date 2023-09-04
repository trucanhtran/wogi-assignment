module Api
  module V1
    module AccessControlApi
      class ProductAccessUpdate < Grape::API
        namespace :access_control do
          desc 'Update product access for the client'
            params do
              requires :user_id, type: Integer, desc: 'ID of the customer'
              requires :product_ids, type: String, desc: 'Comma-separated list of product IDs, e.g. 1,2,3'
            end
            put 'products' do
              client = User.where(user_type: 'client').find(params[:user_id])
              product_ids = params[:product_ids].split(',').map(&:to_i)
              client.product_ids = product_ids
              if client.save
                status 200
                client.products
              else
                status 400
                response_error('400 Failed to update product access', 400)
              end
            rescue => e
              response_error(e.message, 500)
            end
        end
      end
    end
  end
end
