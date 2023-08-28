module Api
  module V1
    module Product do
      class Root < Grape::API
        extend ActiveSupport::Concern

        mount Api::V1::Product::Product
      end
    end
  end
end
