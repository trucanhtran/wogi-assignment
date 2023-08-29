module Api
  module V1
    class Root < Grape::API
      extend ActiveSupport::Concern
      version 'v1', using: :path

			mount Api::V1::Authorization::Authorization
      mount Api::V1::Brand::Brand
      mount Api::V1::Product::Product
      mount Api::V1::State::State
    end
  end
end
