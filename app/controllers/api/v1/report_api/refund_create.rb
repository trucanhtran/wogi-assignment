module Api
  module V1
    module ReportApi
      class RefundCreate < Grape::API
        namespace :report do
          desc 'Refund a purchase'
          params do
            requires :purchase_id, type: Integer, desc: 'ID of the purchase (report)'
          end
          post 'refund' do
            purchase = current_user.reportings.find_by(id: params[:purchase_id])

            if purchase.present?
              if Reporting.find_by(purchase_id: purchase.id).present?
                response_error('Purchase has been refunded', 400)
              end
              card = purchase.card
              refund_amount = purchase.value
              refund_report = Reporting.create(
                user_id: current_user.id,
                card_id: card.id,
                product_id: purchase.product_id,
                purchase_id: purchase.id,
                activity: 'refund',
                value: -refund_amount
              )
              status 200
              { message: "Refund ID #{refund_report.id} successful" }
            elsif purchase.activity != 'purchase'
              response_error('Invalid purchase activity', 400)
            else
              response_error('Purchase not found', 404)
            end
          rescue => e
            response_error(e.message, 400)
          end
        end
      end
    end
  end
end
