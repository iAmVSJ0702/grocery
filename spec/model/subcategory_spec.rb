# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  describe 'validations' do
    let(:subcategory) { build(:subcategory) }

    it 'is valid with valid attributes' do
      expect(subcategory).to be_valid
    end

    it 'is not valid without a name' do
      subcategory.name = nil
      expect(subcategory).to_not be_valid
    end

    it 'is not valid with a duplicate name' do
      create(:subcategory, name: subcategory.name)
      expect(subcategory).to_not be_valid
    end
  end
end
