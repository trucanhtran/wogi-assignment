module Api
  module V1::ReportApi
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        authenticate
      end

      mount Api::V1::ReportApi::ReportCardCancellation
      mount Api::V1::ReportApi::ReportCardCancellationAdmin
      mount Api::V1::ReportApi::ReportCardSpending
      mount Api::V1::ReportApi::PurchaseCreate
      mount Api::V1::ReportApi::RefundCreate
    end
  end
end
