module Api
  module V1
    module BrandApi
      class BrandUpdate < Grape::API
        namespace :brand do
          desc 'Update a brand'
          params do
            requires :id, type: Integer, desc: 'Brand id'
            optional :name, type: String, desc: 'Type name'
            optional :description, type: String, desc: 'Type description'
            optional :website, type: String, desc: 'Type website'
            optional :established_year, type: Integer, desc: 'Type established year'
            optional :location, type: String, desc: 'Type location'
            optional :availability, type: Boolean, desc: 'Type availability'
          end
          put ':id/update' do
            brand = User.find_by(id: 1).brands.find_by(id: params[:id])
            if brand.present? && brand.update(brand_params)
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
