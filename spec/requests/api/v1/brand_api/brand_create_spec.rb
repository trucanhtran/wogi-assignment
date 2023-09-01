RSpec.describe "Api::V1::BrandApi::BrandCreate", type: :request do
  let(:user) { create(:admin) }
  let(:jwt_token) { Auth.encode({ user_id: user.id }) }
  let(:headers) { { "Authorization" => "Bearer #{jwt_token}" } }

  describe "POST /api/v1/brand/create" do
    context 'with valid parameters' do
      let(:brand_params) { attributes_for(:brand) }

      it 'creates a new brand' do
        post '/api/v1/brand/create', params: brand_params, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 200
        expect(body).not_to be_empty
        expect(body['name']).to eq brand_params[:name]
      end
    end

    context 'with invalid parameters' do
      let(:brand_params) { { name: nil } }

      it 'returns an error' do
        post '/api/v1/brand/create', params: brand_params, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 400
        expect(body).not_to be_empty
        expect(body['error']).to eq 'Can not create a new brand'
      end
    end
  end
end
