module Api
  module V1
    module State
      class BrandState < Grape::API
        namespace :state_management do
          desc 'Update brand availability'
          params do
            requires :brand_id, type: Integer, desc: 'ID of the brand'
            requires :availability, type: Boolean, desc: 'Availability status of the brand'
          end
          put ':brand_id/brand' do
            brand = Brand.find_by(id: params[:brand_id])
            if brand.present? && brand.update(availability: params[:availability])
              brand
            else
              response_error('Can not update state of brand', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end

        end
      end
    end
  end
end
