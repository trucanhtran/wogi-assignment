module Api
  module V1
    module CardApi
      class CardRequest < Grape::API
        namespace :card do
          desc 'Request a new card'
          post 'request' do
            card_number = rand(10_000_000..99_999_999)
            card = current_user.cards.new(card_number: card_number, cancelled: false)
            if card.save
              status 200
              { message: "Card #{card.card_number} request successful" }
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
