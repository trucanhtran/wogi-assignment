module Api
  module V1
    module CardApi
      class CardCreate < Grape::API
        namespace :card do
          desc 'Get unique activation number and purchase details pin'
          params do
            requires :value, type: Integer, desc: 'Value of the card (USD)'
          end
          post 'create' do
            is_admin
            code = SecureRandom.hex(8)
            pin = SecureRandom.random_number(10000).to_s.rjust(4, '0')
            card = Card.new(code: code, purchase_details_pin: pin, value: params[:value])
            if card.save
              status 200
              card
            else
              response_error("Can not create a new card", 400)
            end
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
