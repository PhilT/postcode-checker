# frozen_string_literal: true

require_relative '../../lib/sanitize'

class Postcode
  attr_reader :code, :servable, :reason

  def servable?
    return if @code.nil?
    @reason = :invalid and return if @code.empty?

    whitelist_lookup || api_lookup
  end

  def initialize(attributes = {})
    @code = Sanitize.postcode attributes[:code]
  end

  private

  def whitelist_lookup
    whitelist = Whitelist.new(@code)
    found = whitelist.found?
    @reason = whitelist.reason
    found
  end

  def api_lookup
    service = PostcodeService.new(@code)
    allowed = service.allowed?
    @reason = service.reason
    allowed
  end
end
