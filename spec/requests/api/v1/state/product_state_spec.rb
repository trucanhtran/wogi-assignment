
RSpec.describe "Api::V1::State::ProductState", type: :request do
  let!(:user) { create(:admin) }
  let(:jwt_token) { Auth.encode({ user_id: user.id }) }
  let(:headers) { { "Authorization" => "Bearer #{jwt_token}" } }
  let!(:product) { create(:product) }

  describe "PUT /api/v1/state_management/:product_id/product" do
    context 'with valid params' do
      it 'updates the availability of the product' do
        put "/api/v1/state_management/#{product.id}/product", params: { availability: true }, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 200
        expect(body).not_to be_empty
        expect(body['availability']).to eq true
      end
    end

    context 'with invalid product_id' do
      it 'returns an error response' do
        invalid_product_id = -1
        put "/api/v1/state_management/#{invalid_product_id}/product", params: { availability: true }, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 400
        expect(body).not_to be_empty
        expect(body['error']).to eq 'Can not update state of product'
      end
    end
  end
end
