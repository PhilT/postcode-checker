# frozen_string_literal: true

module Sanitize
  def self.postcode(code)
    return unless code

    code.gsub(/[^a-zA-Z0-9]/, '').upcase
  end
end
