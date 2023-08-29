module Api
  module V1
    module Product
      class Product < Grape::API
        namespace :products do
          desc 'Facilitate the addition of brands with the ability to define up to 5 customizable
          data fields for each brand.'
          params do
            requires :name, type: String, desc: 'Name of the product'
            requires :description, type: String, desc: 'Description of the product'
            requires :category, type: String, desc: 'Category of the product'
            requires :stock_quantity, type: Integer, desc: 'Stock quantity of the product'
            requires :price, type: Float, desc: 'Price of the product'
            requires :discount_percentage, type: Float, desc: 'Discount percentage of the product'
            requires :brand_id, type: Integer, desc: 'ID of the associated brand'
          end
          post :create do
            product_params = {
              name: params[:name],
              description: params[:description],
              category: params[:category],
              stock_quantity: params[:stock_quantity],
              price: params[:price],
              discount_percentage: params[:discount_percentage]
            }
            brand = ::Brand.find(params[:brand_id])
            product = brand.products.new(product_params)
            product.availability = true
            if product.save
              status 200
              product
            else
              status 400
              { error: 'Invalid fields' }
            end
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Delete a product'
          params do
            requires :id, type: Integer, desc: 'ID of the product to delete'
          end
          delete ':id' do
            product = ::Product.find(params[:id])  # Sử dụng ::Product để truy cập model Product bên ngoài module Api::V1
            if product.destroy
              status 200
              { message: 'Product deleted successfully' }
            else
              status 400
              { error: 'Failed to delete product' }
            end
          rescue ActiveRecord::RecordNotFound
            status 404
            { error: 'Product not found' }
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Update a product'
          params do
            requires :id, type: Integer, desc: 'ID of the product to update'
            optional :name, type: String, desc: 'Updated name of the product'
            optional :description, type: String, desc: 'Updated description of the product'
            optional :category, type: String, desc: 'Updated category of the product'
            optional :stock_quantity, type: Integer, desc: 'Updated stock quantity of the product'
            optional :price, type: Float, desc: 'Updated price of the product'
            optional :discount_percentage, type: Float, desc: 'Updated discount percentage of the product'
          end
          patch ':id' do
            product = ::Product.find(params[:id])
            if product.update(declared(params, include_missing: false))
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

          desc 'Get product by ID'
          params do
            requires :product_id, type: Integer, desc: 'ID of the product'
          end
          get ':id' do
            product = ::Product.find(params[:product_id])
            status 200
            product
          rescue ActiveRecord::RecordNotFound
            status 404
            { error: 'Product not found' }
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Get products list'
          get do
            product = ::Product.all
            status 200
            product
          rescue ActiveRecord::RecordNotFound
            status 404
            { error: 'Product not found' }
          rescue => e
            status 500
            { error: e.message }
          end

          desc "Product create"
          params do
            requires :name, type: String, desc: "Name"
          end
          post 'product' do
            product = Product.new(name: params[:name], brand_id: 1)
            product.save!
            product
          end
        end
      end
    end
  end
end
