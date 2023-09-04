module Api
  module V1
    module State
      class ProductState < Grape::API
        namespace :state_management do
          desc 'Update product availability'
          params do
            requires :product_id, type: Integer, desc: 'ID of the product'
            requires :availability, type: Boolean, desc: 'Availability status of the product'
          end
          put ':product_id/product' do
            product = Product.find_by(id: params[:product_id])
            if product.present? && product.update(availability: params[:availability])
              product
            else
              response_error('Can not update state of product', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
