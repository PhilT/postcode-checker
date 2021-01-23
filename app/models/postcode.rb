# frozen_string_literal: true

require_relative '../../lib/sanitize'

class Postcode
  attr_reader :code

  def initialize(code)
    @code = Sanitize.postcode code
  end

  def lookup(providers)
    return nil if @code.nil?
    return :invalid if @code.empty?

    providers.reduce(:outside) do |prev, provider|
      return prev if prev == :within

      provider.new(@code).lookup
    end
  end
end
