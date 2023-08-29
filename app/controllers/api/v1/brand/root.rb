module Api
  module V1::Brand
    class Root < Grape::API
      extend ActiveSupport::Concern

      before do
        # authenticate
      end

      mount Api::V1::Brand::Brand
    end
  end
end
