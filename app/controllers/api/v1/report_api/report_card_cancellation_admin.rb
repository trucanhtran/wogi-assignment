module Api
  module V1
    module ReportApi
      class ReportCardCancellationAdmin < Grape::API
        namespace :report do
          desc 'Generate card cancellation report for current user'
          get 'admin/cards_cancellation' do
            cancellation_report = Card.includes(:user).where(cancelled: true)
            
            status 200
            { report: cancellation_report }
          end
        end
      end
    end
  end
end
