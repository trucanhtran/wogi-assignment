module Api
  module V1
    class Root < Grape::API
      extend ActiveSupport::Concern
      version 'v1', using: :path

			mount Api::V1::Authorization::Authorization
    end
  end
end
