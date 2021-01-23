# frozen_string_literal: true

require_relative '../../lib/sanitize'

class Postcode
  attr_reader :code

  def initialize(code)
    @code = Sanitize.postcode code
  end

  def lookup(providers)
    return [nil, nil] if @code.nil?
    return [:invalid, ''] if @code.empty?

    providers.reduce([:invalid, nil]) do |prev, provider|
      status, _formatted = prev
      return prev if status == :within

      provider.lookup(@code)
    end
  end
end
