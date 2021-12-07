#1. we need a Product so we actually have something to buy
#2. We need a user so we know who ordered a product
#3. we need to ba able to create an Order and connect/associate with user
#4. we need to associate an order with a product using joint table that we will call OrderItem

RSpec.describe "POST /api/orders" do
    subject {response}

    before do
        post "/api/orders", params: { order: {product_id: 1, user_id: 1}}
    end

    it {is_expected.to have_http_status 201} 
end
