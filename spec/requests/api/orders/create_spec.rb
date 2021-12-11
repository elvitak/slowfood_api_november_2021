RSpec.describe 'POST /api/orders', type: :request do
  subject { response }
  before do
    post '/api/orders', params: { order: { product_id: 1, user_id: 1 } }
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of Order' do
    expect(Order.last).to_not eq nil
  end
end
