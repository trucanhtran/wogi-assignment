module Api
  module V1
    module ReportApi
      class PurchaseCreate < Grape::API
        namespace :report do
          desc 'Create a purchase report'
          params do
            requires :product_id, type: Float, desc: 'Purchase amount'
            requires :card_id, type: Integer, desc: 'ID of the card'
          end
          post 'purchase' do
            product = Product.where(availability: true).find(params[:product_id])
            calculated_price = product.calculate_price_with_discount
            purchase = current_user.reportings.new(activity: 'purchase', value: calculated_price, product_id: params[:product_id], card_id: params[:card_id])
            byebug
            if purchase.save
              status 201
              { message: "Purchase ID #{purchase.id} created successfully" }
            else
              status 400
              response_error('Failed to create purchase report', 400)
            end
          rescue => e
            status 500
            { error: e.message }
          end
        end
      end
    end
  end
end
