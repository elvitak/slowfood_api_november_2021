RSpec.describe Order, type: :model do
  describe 'Database table' do
    it {
      is_expected.to have_db_column(:id)
        .of_type(:integer)
    }
    it {
      is_expected.to have_db_column(:user_id)
        .of_type(:integer)
    }
  end

  describe 'Association' do
    it {
      is_expected.to belong_to(:user)
    }
    it { is_expected.to have_many(:items).class_name('OrderItem') }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:order)).to be_valid
    end
  end

  describe 'Instance methods' do
    describe '#serialized' do
      let(:product1) { create(:product, name: 'Pancakes') }
      let(:product2) { create(:product, name: 'Soup') }
      let!(:order) { create(:order) }
      let!(:order_item1) { create(:order_item, order: order, product: product1) }
      let!(:order_item2) { create(:order_item, order: order, product: product2) }

      it { is_expected.to respond_to :serialized }

      it 'is expected to return json object including items' do
        expect(order.serialized[:products].size).to eq 2
      end
    end
  end
end
