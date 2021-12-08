RSpec.describe OrderItem, type: :model do
  describe 'Database Table' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }

    it { is_expected.to have_db_column(:order_id).of_type(:integer) }

    it { is_expected.to have_db_column(:product_id).of_type(:integer) }
  end

  describe 'Associations' do
  end
end
