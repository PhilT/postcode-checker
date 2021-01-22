# frozen_string_literal: true

class Postcode
  attr_reader :code, :allowed

  def allowed?
    whitelist? || api?
  end

  def initialize(attributes = {})
    @code = attributes[:code]
    @allowed = attributes[:allowed]
  end

  private

  def whitelist?
    Whitelist.include?(@code.gsub(' ', ''))
  end

  def api?
    service = Postcodes::IO.new
    response = service.lookup(@code)
    response.lsoa =~ /^Southwark |^Lambeth /
  end
end
