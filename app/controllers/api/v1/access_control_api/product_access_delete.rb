module Api
  module V1
    module AccessControlApi
      class ProductAccessDelete < Grape::API
        namespace :access_control do
          desc 'Delete product access for the client'
          params do
            requires :product_id, type: Integer, desc: 'ID of the product'
          end
          delete 'products/:product_id' do
            access_control = current_user.access_controls.find_by(product_id: params[:product_id])
            if access_control
              access_control.destroy
              status 201
              { message: 'Product access revoked successfully' }
            else
              response_error('Product access not found', 404)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end