require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "validations" do
    let(:order) { build(:order) }

    it 'is not valid without a title' do
      order.name = nil
      expect(order).to_not be_valid
    end

    it 'is not valid without a price' do
      order.email = nil
      expect(order).to_not be_valid
    end

    it 'is not valid without a title' do
      order.address = nil
      expect(order).to_not be_valid
    end

    it 'is not valid without a price' do
      order.phone = nil
      expect(order).to_not be_valid
    end

  end
end
