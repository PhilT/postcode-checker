# frozen_string_literal: true

require_relative '../../lib/sanitize'

class Postcode
  attr_reader :code, :allowed

  def allowed?
    return if @code.blank?

    in_whitelist? || api_allows?
  end

  def initialize(attributes = {})
    @code = Sanitize.postcode attributes[:code]
    @allowed = attributes[:allowed]
  end

  private

  def in_whitelist?
    Whitelist.new(@code).found?
  end

  def api_allows?
    service = Postcodes::IO.new
    response = service.lookup(@code)
    response.lsoa =~ /^Southwark |^Lambeth /
  end
end
