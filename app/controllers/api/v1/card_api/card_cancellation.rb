module Api
  module V1
    module CardApi
      class CardCancellation < Grape::API
        namespace :card do
          desc 'Cancel a card'
          delete ':code/cancel' do
            card = current_user.cards.find_by(code: params[:code])
            if card.cancelled
              response_error('Card is already cancelled', 400)
            else
              card.update(cancelled: true, cancelled_at: Time.now)
              status 200
              { message: 'Card cancelled successfully' }
            end
          rescue ActiveRecord::RecordNotFound
            response_error('Card not found', 404)
          rescue => e
            response_error(e.message, 500)
          end
        end
      end
    end
  end
end
