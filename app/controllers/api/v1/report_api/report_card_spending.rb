module Api
  module V1
    module ReportApi
      class ReportCardSpending < Grape::API
        namespace :report do
          desc 'Generate comprehensive spending report'
          get 'comprehensive_spending' do
            spending_reports = current_user.reportings

            total_spent = spending_reports.sum(:value)
            report_details = spending_reports.select(:id, :activity, :value, :card_id, :product_id)

            status 200
            {
              total_spent: total_spent,
              report_details: report_details
            }
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end