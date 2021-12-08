# 1. we need a Product so we actually have something to buy
# 2. We need a user so we know who ordered a product
# 3. we need to ba able to create an Order and connect/associate with user
# 4. we need to associate an order with a product using joint table that we will call OrderItem
# 5. Ideally response should include the order and order items so that this info can be used on client side
# the minimum is to include the order id in the response

RSpec.describe 'POST /api/orders', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  subject { response }

  before do
    post '/api/orders', params: { order: { product_id: product.id, user_id: user.id } }
    @order = Order.last
  end

  it { is_expected.to have_http_status 201 }

  it 'is expected to create an istance of Order' do
    expect(@order).to_not eq nil
  end

  it 'is expected to assosiate order with user' do
    expect(@order.user).to eq user
  end

  it 'is expected to create an order item' do
    expect(@order.items).to_not eq nil
  end

  it 'is expected to associate the product with the order' do
    expect(@order.products.first).to eq product
  end

  it 'is expected to include the ID of the order in the response body' do
    response_body = JSON.parse(response.body)
    expect(response_body['order']['id']).to eq @order.id
  end
end
