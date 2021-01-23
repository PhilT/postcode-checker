# frozen_string_literal: true

require_relative '../../lib/sanitize'

class Postcode
  attr_reader :code, :servable

  def servable?
    return if @code.blank?

    in_whitelist? || PostcodeService.new(@code).allowed?
  end

  def initialize(attributes = {})
    @code = Sanitize.postcode attributes[:code]
  end

  private

  def in_whitelist?
    Whitelist.new(@code).found?
  end
end
