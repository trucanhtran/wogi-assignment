module Api
  module V1::Product
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::Product::Product
    end
  end
end
