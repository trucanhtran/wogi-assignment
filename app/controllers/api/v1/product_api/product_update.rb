module Api
  module V1
    module ProductApi
      class ProductUpdate < Grape::API
        namespace :product do
          desc 'Update a product'
          params do
            requires :id, type: Integer, desc: 'ID of the product to update'
            optional :name, type: String, desc: 'Updated name of the product'
            optional :description, type: String, desc: 'Updated description of the product'
            optional :category, type: String, desc: 'Updated category of the product'
            optional :stock_quantity, type: Integer, desc: 'Updated stock quantity of the product'
            optional :price, type: Float, desc: 'Updated price of the product'
            optional :discount_percentage, type: Float, desc: 'Updated discount percentage of the product'
            optional :availability, type: Boolean, desc: 'Type availability'
          end
          put ':id' do
            product = Product.find_by(id: params[:id])
            if product.present? && product.update(product_params)
              product
            else
              response_error('Can not update a product', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
