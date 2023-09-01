module Api
  module V1
    module CardApi
      class CardRequest < Grape::API
        namespace :card do
          desc 'Request a new card'
          params do
            requires :product_id, type: Integer, desc: 'ID of the product'
            requires :code, type: String, desc: 'Activation code'
            requires :purchase_details_pin, type: String, desc: 'Purchase details pin'
          end
          post 'request' do
            user = current_user
            card = Card.find_by(
              code: params[:code],
              purchase_details_pin: params[:purchase_details_pin],
              cancelled: false,
              user_id: nil,
              product_id: nil
              )
            if card
              card.update(user_id: user.id, product_id: params[:product_id])
              status 200
              { message: "Card #{card.code} request successful" }
            else
              response_error('Failed to request a new card', 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
