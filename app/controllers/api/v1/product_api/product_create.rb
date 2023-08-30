module Api
  module V1
    module ProductApi
      class ProductCreate < Grape::API
        namespace :product do
          desc 'Create a new product'
          params do
            requires :brand_id, type: Integer, desc: 'The brand identifier'
            requires :name, type: String, desc: 'Name of the product'
            optional :description, type: String, desc: 'Description of the product'
            optional :category, type: String, desc: 'Category of the product'
            optional :stock_quantity, type: Integer, desc: 'Stock quantity of the product'
            optional :price, type: Float, desc: 'Price of the product'
            optional :discount_percentage, type: Float, desc: 'Discount percentage of the product'
            optional :brand_id, type: Integer, desc: 'ID of the associated brand'
            optional :availability, type: Boolean, desc: 'Type availability'
          end
          post ':brand_id/create' do
            brand = Brand.find_by(id: params[:brand_id])
            brand || response_error('Can not find brand', 400)

            product = brand.products.new(product_params)
            if brand.present? && product.save
              product
            else
              response_error('Can not create a new product', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
