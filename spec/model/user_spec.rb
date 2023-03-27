# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with an invalid email format' do
    user.email = 'invalidemail'
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:user, email: user.email)
    expect(user).to_not be_valid
  end

  it 'is not valid without a phone number' do
    user.phone = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with an invalid phone number length' do
    user.phone = '12345678901'
    expect(user).to_not be_valid
  end

  it 'is not valid with a non-numeric phone number' do
    user.phone = 'abcdefghij'
    expect(user).to_not be_valid
  end

  describe 'callbacks' do
    it 'downcases the email before creating the user' do
      user = create(:user, email: 'UPPERCASE@EMAIL.COM')
      expect(user.email).to eq 'uppercase@email.com'
    end
  end
end
