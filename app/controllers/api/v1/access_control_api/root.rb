module Api
  module V1::AccessControlApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::AccessControlApi::ProductAccessList
      mount Api::V1::AccessControlApi::ProductAccessUpdate
      mount Api::V1::AccessControlApi::ProductAccessAdmin
      mount Api::V1::AccessControlApi::ProductAccessDelete
    end
  end
end
