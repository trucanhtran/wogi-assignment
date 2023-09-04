module Api
  module V1
    class Root < Grape::API
      extend ActiveSupport::Concern
      version 'v1', using: :path

      helpers do
        def current_user
          if auth_present?
            user = User.find_by(id: auth["user_id"])
            if user
              @current_user ||= user
            end
          end
        end

        def authenticate
          current_user || response_error
        end

        def is_admin
          current_user.admin? || response_error('403 Deny Access', 403)
        end

        def is_client
          current_user.user_type == 'client' || response_error('403 Deny Access', 403)
        end

        def response_error(message='401 Unauthorized', status = 401)
          error!(message, status)
        end

        def parameters
          ActionController::Parameters.new(params)
        end

        private

        def token
          request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
        end

        def auth
          Auth.decode(token)
        end

        def auth_present?
          !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
        end
      end

			mount Api::V1::Authorization::Root
      mount Api::V1::BrandApi::Root
      mount Api::V1::ProductApi::Root
      mount Api::V1::State::Root
      mount Api::V1::AccessControlApi::Root
      mount Api::V1::CardApi::Root
      mount Api::V1::ReportApi::Root
      mount Api::V1::ClientApi::Root
    end
  end
end
