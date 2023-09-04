module Api
  module V1
    module BrandApi
      class BrandRead < Grape::API
        namespace :brand do
          desc 'Get a list of products for a specific brand'
          params do
            requires :id, type: Integer, desc: 'ID of the brand'
          end
          get ':id/products' do
            brand = Brand.find_by(id: params[:id])
            if brand.present?
              brand.products
            else
              response_error('Brand not found', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end

          desc 'Get a brand detail'
          params do
            requires :id, type: Integer, desc: 'ID of the brand'
          end
          get ':id' do
            brand = Brand.find_by(id: params[:id])
            if brand.present?
              brand
            else
              response_error('Brand not found', 404)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
