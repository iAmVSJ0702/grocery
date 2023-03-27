require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    let(:item) { build(:item) }

    it 'is valid with valid attributes' do
      expect(item).to be_valid
    end
  
    it 'is not valid without a title' do
      item.title = nil
      expect(item).to_not be_valid
    end

    it 'is not valid without a price' do
      item.price = nil
      expect(item).to_not be_valid
    end

    it "is valid with a unique title" do
      item1 = FactoryBot.create(:item, title: "Unique Title", price: 10)
      item2 = FactoryBot.build(:item, title: "Another Unique Title", price: 20)

      expect(item1).to be_valid
      expect(item2).to be_valid
    end

    it "requires a numerical price" do
      item = Item.new(title: "Example Item", price: "not a number")
      expect(item).to_not be_valid
      expect(item.errors[:price]).to include("is not a number")
    end

  end
end
