# frozen_string_literal: true

# This is ApplicationRecord model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def valid(id)
    return false if id.nil? || id == ''

    true
  end
end
