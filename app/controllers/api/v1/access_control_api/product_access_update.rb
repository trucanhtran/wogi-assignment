module Api
  module V1
    module AccessControlApi
      class ProductAccessUpdate < Grape::API
        namespace :access_control do
          desc 'Update product access for the client'
            params do
              requires :product_ids, type: String, desc: 'Comma-separated list of product IDs, e.g. 1,2,3'
            end
            put 'products' do
              customer = current_user
              product_ids = params[:product_ids].split(',').map(&:to_i)
              customer.product_ids = product_ids
              if customer.save
                status 200
                customer.products
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