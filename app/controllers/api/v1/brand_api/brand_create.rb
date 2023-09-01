module Api
  module V1
    module BrandApi
      class BrandCreate < Grape::API
        namespace :brand do
          desc 'Create a new brand'
          params do
            requires :name, type: String, desc: 'Type name'
            optional :description, type: String, desc: 'Type description'
            optional :website, type: String, desc: 'Type website'
            optional :established_year, type: Integer, desc: 'Type established year'
            optional :location, type: String, desc: 'Type location'
            optional :availability, type: Boolean, desc: 'Type availability'
          end
          post :create do
            brand = current_user.brands.new(brand_params)
            if brand.save
              status 200
              brand
            else
              response_error('Can not create a new brand', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
