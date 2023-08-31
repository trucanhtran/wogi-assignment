module Api
  module V1
    module CardApi
      class CardList < Grape::API
        namespace :card do
          desc 'Get a list of client cards'
          get do
            cards = current_user.cards.where(cancelled: false).select(:id, :card_number)
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
