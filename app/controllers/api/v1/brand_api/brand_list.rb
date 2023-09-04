module Api
  module V1
    module BrandApi
      class BrandList < Grape::API
        namespace :brand do
          desc 'Get a list of brands'
          get do
            Brand.all
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
