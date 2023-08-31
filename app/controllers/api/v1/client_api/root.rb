module Api
  module V1::ClientApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::ClientApi::ClientCreate
      mount Api::V1::ClientApi::ClientList
    end
  end
end
