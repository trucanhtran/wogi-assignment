module Api
  module V1::BrandApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      helpers do
        def brand_params
          parameters.permit(:name, :description, :website, :established_year, :location, :availability)
        end
      end

      before do
        is_admin
      end

      mount Api::V1::BrandApi::BrandRead
      mount Api::V1::BrandApi::BrandCreate
      mount Api::V1::BrandApi::BrandUpdate
      mount Api::V1::BrandApi::BrandList
    end
  end
end
