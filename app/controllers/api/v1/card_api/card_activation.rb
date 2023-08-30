module Api
  module V1
    module CardApi
      class CardActivation < Grape::API
        namespace :card do
          desc 'Get unique activation number and purchase details pin'
          params do
            requires :card_number, type: Integer, desc: 'Number of the card'
          end
          post 'activation' do
            card = Card.where(card_number: params[:card_number], unique_activation_number: nil, purchase_details_pin: nil).first
            if card
              activation_number = SecureRandom.hex(8)
              pin = SecureRandom.random_number(10000).to_s.rjust(4, '0')
              card.update(unique_activation_number: activation_number, purchase_details_pin: pin)
              status 200
              { activation_number: activation_number, purchase_details_pin: pin }
            else
              response_error('Card not found', 404)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
