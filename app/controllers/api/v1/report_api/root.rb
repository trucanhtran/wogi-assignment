module Api
  module V1::ReportApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::ReportApi::ReportCardCancellation
      mount Api::V1::ReportApi::ReportCardSpending
    end
  end
end
