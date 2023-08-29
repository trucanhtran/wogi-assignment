module Api
  module V1
    module State
      class State < Grape::API
        namespace :state_management do
          desc 'Update product availability'
          params do
            requires :product_id, type: Integer, desc: 'ID of the product'
            requires :availability, type: Boolean, desc: 'Availability status of the product'
          end
          put ':product_id' do
            product = ::Product.find(params[:product_id])
            if product.update(availability: params[:availability])
              status 200
              product
            else
              status 400
              { error: 'Invalid fields' }
            end
          rescue ActiveRecord::RecordNotFound
            status 404
            { error: 'Product not found' }
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Update brand availability'
          params do
            requires :brand_id, type: Integer, desc: 'ID of the brand'
            requires :availability, type: Boolean, desc: 'Availability status of the brand'
          end
          put ':brand_id' do
            brand = ::Brand.find(params[:brand_id])
            if brand.update(availability: params[:availability])
              status 200
              brand
            else
              status 400
              { error: 'Invalid fields' }
            end
          rescue ActiveRecord::RecordNotFound
            status 404
            { error: 'Brand not found' }
          rescue => e
            status 500
            { error: e.message }
          end

        end
      end
    end
  end
end
