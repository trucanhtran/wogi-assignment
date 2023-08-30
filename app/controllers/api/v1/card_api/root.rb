module Api
  module V1::CardApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::CardApi::CardRequest
      mount Api::V1::CardApi::CardActivation
      mount Api::V1::CardApi::CardList
      mount Api::V1::CardApi::CardCancellation
    end
  end
end
