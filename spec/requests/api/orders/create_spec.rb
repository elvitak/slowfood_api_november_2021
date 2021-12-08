#1. we need a Product so we actually have something to buy
#2. We need a user so we know who ordered a product
#3. we need to ba able to create an Order and connect/associate with user
#4. we need to associate an order with a product using joint table that we will call OrderItem

RSpec.describe "POST /api/orders", type: :request do
    let(:user) {create(:user)}
    let(:product) {create(:product)}
    subject {response}

    before do
        post "/api/orders", params: { order: {product_id: product.id, user_id: user.id}}
        @order = Order.last
    end

    it {is_expected.to have_http_status 201} 

    it "is expected to create an istance of Order" do
        expect(@order).to_not eq nil
    end

    it "is expected to assosiate order with user" do
        expect(@order.user).to eq user
    end


    it "is expected to create an order item" do
        expect(@order.items).to_not eq nil
    end

    it "is expected to associate the product with the order" do
        expect(@order.products.first).to eq product
    end
end
