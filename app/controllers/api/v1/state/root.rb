module Api
  module V1::State
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::State::ProductState
      mount Api::V1::State::BrandState
    end
  end
end
