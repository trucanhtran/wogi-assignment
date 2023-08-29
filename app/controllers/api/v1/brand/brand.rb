module Api
  module V1
    module Brand
      class Brand < Grape::API
        namespace :brands do
          desc 'Facilitate the addition of brands with the ability to define up to 5 customizable
          data fields for each brand.'
          params do
            requires :name, type: String, desc: 'Type name'
            requires :description, type: String, desc: 'Type description'
            requires :website, type: String, desc: 'Type website'
            requires :established_year, type: Integer, desc: 'Type established year'
            requires :location, type: String, desc: 'Type location'
          end
          post :create do
            brand_params = {
              name: params[:name],
              description: params[:description],
              website: params[:website],
              established_year: params[:established_year],
              location: params[:location],
            }
            brand = User.find(1).brands.new(brand_params)
            if brand.save
              status 200
              brand
            else
              status 400
              { error: 'Invalid fields' }
            end
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Get a list of brands'
          get do
            brands = ::Brand.all
            status 200
            brands
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Get a list of products for a specific brand'
          params do
            requires :id, type: Integer, desc: 'ID of the brand'
          end
          get 'products' do
            brand = ::Brand.find(params[:id])
            products = brand.products
            status 200
            products
          rescue ActiveRecord::RecordNotFound
            status 404
            { error: 'Brand not found' }
          rescue => e
            status 500
            { error: e.message }
          end

          desc 'Delete a brand by ID'
          params do
            requires :id, type: Integer, desc: 'ID of the brand'
          end
          delete do
            brand = ::Brand.find(params[:id])
            brand.destroy
            status 204
            { success: 'Delete successfully' }
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
