# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    let(:category) { build(:category) }

    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is not valid with a duplicate name' do
      create(:category, name: category.name)
      expect(category).to_not be_valid
    end
  end
end
