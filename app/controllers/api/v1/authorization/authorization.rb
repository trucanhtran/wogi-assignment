module Api
  module V1
    module Authorization
      class Authorization < Grape::API
        get :test do
          status 200
          {data: 1}
        end
      end
    end
  end
end
