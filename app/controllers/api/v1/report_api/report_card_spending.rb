module Api
  module V1
    module ReportApi
      class ReportCardSpending < Grape::API
        namespace :report do
          desc 'Generate comprehensive spending report'
          get 'comprehensive_spending' do
            user = current_user
            user_cards = Card.where(user_id: user.id).select(:id, :code, :value)
            total_spending = Product.where(id: user_cards.pluck(:product_id)).sum(:price_cents)

            status 200
            {total_spending: total_spending, used_cards: user_cards}
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
