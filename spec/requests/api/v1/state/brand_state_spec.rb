RSpec.describe "Api::V1::State::BrandState", type: :request do
  let!(:user) { create(:admin) }
  let(:jwt_token) { Auth.encode({ user_id: user.id }) }
  let(:headers) { { "Authorization" => "Bearer #{jwt_token}" } }
  let!(:brand) { create(:brand) }

  describe "PUT /api/v1/state_management/:brand_id/brand" do
    context 'with valid params' do
      it 'updates the availability of the brand' do
        put "/api/v1/state_management/#{brand.id}/brand", params: { availability: true }, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 200
        expect(body).not_to be_empty
        expect(body['availability']).to eq true
      end
    end

    context 'with invalid brand_id' do
      it 'returns an error response' do
        invalid_brand_id = -1
        put "/api/v1/state_management/#{invalid_brand_id}/brand", params: { availability: true }, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 400
        expect(body).not_to be_empty
        expect(body['error']).to eq 'Can not update state of brand'
      end
    end
  end
end
