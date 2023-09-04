
RSpec.describe "Api::V1::ProductApi::ProductCreate", type: :request do
  let!(:user) { create(:admin) }
  let(:jwt_token) { Auth.encode({ user_id: user.id }) }
  let(:headers) { { "Authorization" => "Bearer #{jwt_token}" } }
  let!(:brand) { create(:brand) }
  let(:name) { 'Product Name' }
  let(:description) { 'Product Description' }
  let(:category) { 'Product Category' }
  let(:stock_quantity) { 10 }
  let(:price) { 1000 }
  let(:price_currency) { 'USD' }
  let(:discount_percentage) { 10.0 }
  let(:availability) { true }

  let(:params) do
    {
      brand_id: brand.id,
      name: name,
      description: description,
      category: category,
      stock_quantity: stock_quantity,
      price: price,
      price_currency: price_currency,
      discount_percentage: discount_percentage,
      availability: availability
    }
  end

  subject { post "/api/v1/product/#{brand.id}/create", params: params, headers: headers }

  describe "POST /api/v1/product/:brand_id/create" do
    context 'with valid params' do
      it 'creates a new product' do
        subject
        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 200
        expect(body).not_to be_empty
        expect(body['name']).to eq name
        expect(body['description']).to eq description
        expect(body['category']).to eq category
        expect(body['stock_quantity']).to eq stock_quantity
        expect(body['price_cents']).to eq price.to_i
        expect(body['price_currency']).to eq price_currency
        expect(body['discount_percentage']).to eq discount_percentage.to_s
        expect(body['availability']).to eq availability
        expect(body['brand_id']).to eq brand.id
      end
    end

    context 'with invalid brand_id' do
      it 'returns an error response' do
        invalid_brand_id = -1
        post "/api/v1/product/#{invalid_brand_id}/create", params: params, headers: headers

        body = JSON.parse(response.body)
        status = response.status

        expect(status).to eq 400
        expect(body).not_to be_empty
        expect(body['error']).to eq 'Can not find brand'
      end
    end

  end
end
