module Api
  module V1
    module ProductApi
      class ProductList < Grape::API
        namespace :product do
          desc 'Get products list'
          get 'list' do
            Product.all
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
