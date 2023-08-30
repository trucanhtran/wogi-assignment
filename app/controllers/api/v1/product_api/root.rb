module Api
  module V1::ProductApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      helpers do
        def product_params
          parameters.permit(:name, :description, :category, :stock_quantity, :price, :discount_percentage, :availability)
        end
      end

      mount Api::V1::ProductApi::ProductList
      mount Api::V1::ProductApi::ProductCreate
      mount Api::V1::ProductApi::ProductUpdate
      mount Api::V1::ProductApi::ProductDelete
      mount Api::V1::ProductApi::ProductRead
    end
  end
end
