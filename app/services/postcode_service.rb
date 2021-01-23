# frozen_string_literal: true

require 'net/http'
require 'json'

class PostcodeService
  POSTCODES_IO_BASE_URI = 'https://api.postcodes.io/postcodes/'
  ALLOWED_LSOAS = /^Southwark |^Lambeth /

  attr_reader :code, :formatted, :status

  def initialize(sanitized_code)
    @code = sanitized_code
  end

  def lookup
    response = Net::HTTP.get_response(URI("#{POSTCODES_IO_BASE_URI}#{@code}"))

    if response.code == '200'
      json_response = JSON.parse(response.body)
      allowed = json_response['result']['lsoa'] =~ ALLOWED_LSOAS
      @status = allowed ? :within : :outside
    else
      @status = response.code == '404' ? :invalid : :unavailable
    end
  end
end
