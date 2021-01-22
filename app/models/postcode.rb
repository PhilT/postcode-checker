# frozen_string_literal: true

class Postcode
  attr_reader :code, :allowed

  def allowed?
    service = Postcodes::IO.new
    response = service.lookup(@code)
    response.lsoa =~ /^Southwark |^Lambeth /
  end

  def initialize(attributes = {})
    @code = attributes[:code]
    @allowed = attributes[:allowed]
  end
end
