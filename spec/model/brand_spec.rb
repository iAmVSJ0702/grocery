require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe "validations" do
    let(:brand) { build(:brand) }

    it 'is valid with valid attributes' do
      expect(brand).to be_valid
    end
  
    it 'is not valid without a name' do
      brand.name = nil
      expect(brand).to_not be_valid
    end

    it 'is not valid with a duplicate name' do
      create(:brand, name: brand.name)
      expect(brand).to_not be_valid
    end
  end
end
