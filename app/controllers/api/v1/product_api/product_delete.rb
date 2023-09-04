module Api
  module V1
    module ProductApi
      class ProductDelete < Grape::API
        namespace :product do
          desc 'Delete a product'
          params do
            requires :id, type: Integer, desc: 'ID of the product to delete'
          end
          delete ':id' do
            product = Product.find_by(id: params[:id])
            if product.destroy
              { message: 'Product deleted successfully' }
            else
              response_error('Failed to delete product', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
