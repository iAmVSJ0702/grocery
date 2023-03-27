# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    name { 'Vaibhav' }
    email { 'vaibhav@example.com' }
    address { 'Varanasi' }
    phone { '9129422222' }
  end
end
