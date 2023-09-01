module Api
  module V1
    module ReportApi
      class ReportCardCancellation < Grape::API
        namespace :report do
          desc 'Generate card cancellation report for current user'
          get 'cards_cancellation' do
            user = current_user
            cancellation_report = Card.where(cancelled: true, user_id: user.id)
            formatted_report = cancellation_report.select(:code, :cancelled_at, :created_at)

            status 200
            { report: formatted_report }
          end
        end
      end
    end
  end
end
