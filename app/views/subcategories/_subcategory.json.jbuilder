# frozen_string_literal: true

json.extract! subcategory, :id, :created_at, :updated_at
json.url subcategory_url(subcategory, format: :json)
