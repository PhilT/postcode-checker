# frozen_string_literal: true

require 'net/http'
require 'json'

class PostcodeService
  POSTCODES_IO_BASE_URI = 'https://api.postcodes.io/postcodes/'
  ALLOWED_LSOAS = /^Southwark |^Lambeth /

  def self.lookup(sanitized_code)
    response = Net::HTTP.get_response(URI("#{POSTCODES_IO_BASE_URI}#{sanitized_code}"))

    if response.code == '200'
      json_response = JSON.parse(response.body)
      allowed = json_response['result']['lsoa'] =~ ALLOWED_LSOAS
      formatted = json_response['result']['postcode']

      [allowed ? :within : :outside, formatted]
    else
      [response.code == '404' ? :invalid : :unavailable, sanitized_code]
    end
  end
end
