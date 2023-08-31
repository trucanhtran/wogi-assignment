module Api
  module V1
    module ReportApi
      class ReportCardCancellation < Grape::API
        namespace :report do
          desc 'Generate card cancellation report for current user'
          get 'cards_cancellation' do
            cancellation_report = current_user.cards.where(cancelled: true)
            formatted_report = cancellation_report.select(:card_number, :cancelled_at, :created_at)
            
            status 200
            { report: formatted_report }
          end
        end
      end
    end
  end
end
