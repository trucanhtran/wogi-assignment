module Api
  module V1
    module ProductApi
      class ProductRead < Grape::API
        namespace :product do
          desc 'Get product by ID'
          params do
            requires :id, type: Integer, desc: 'ID of the product'
          end
          get ':id' do
            product = Product.find_by(id: params[:id])
            if product.present?
              product
            else
              response_error('Product not found', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
