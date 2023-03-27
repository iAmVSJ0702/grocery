# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Vaibhav Joshi' }
    email { 'vaibhavJoshi@example.com' }
    phone { '9129422285' }
    address { 'Varanasi' }
    password { 'password' }
    account_type { 'normal' }
  end
end
